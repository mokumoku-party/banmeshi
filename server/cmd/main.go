package main

import (
	"net/http"

	"context"
	"fmt"

	"database/sql"

	"github.com/bufbuild/connect-go"
	"github.com/rs/cors"

	"github.com/redis/rueidis"

	_ "github.com/go-sql-driver/mysql"

	"github.com/mokumoku-party/banmeshi/server/pkg/grpc"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service/serviceconnect"
)

var db *sql.DB
var redisClient rueidis.Client

type InventoryServer struct{}

type RecipeServer struct{}

type HcServer struct{}

func (s *InventoryServer) FetchInventory(ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[service.Inventory], error) {
	rows, err := db.Query("select name, amount, unit, created_at from ingredient where user_name=?", req.Msg.Name)
	if err != nil {
		fmt.Println("database error on FetchInventory")
	}
	resArray := []*grpc.Ingredient{}

	for rows.Next() {
		var name, unit string
		var amount float64
		var created_at int64
		_ = rows.Scan(&name, &amount, &unit, &created_at)

		unitEnum := *grpc.IngredientUnit_quantity.Enum()
		if unit == "grams" {
			unitEnum = *grpc.IngredientUnit_grams.Enum()
		}

		resStruct := &grpc.Ingredient{
			Name:         name,
			Amount:       amount,
			Unit:         unitEnum,
			RegisterDate: created_at,
		}

		resArray = append(resArray, resStruct)
	}
	res := connect.NewResponse(&service.Inventory{Ingredients: resArray})
	return res, err
}

func (s *InventoryServer) AddInventory(ctx context.Context, req *connect.Request[service.Item]) (*connect.Response[grpc.Void], error) {
	user := req.Msg.User.Name
	ingredient := req.Msg.Ingredient
	unitMap := grpc.IngredientUnit_name
	unit := unitMap[int32(ingredient.Unit)]
	result, err := db.Exec("INSERT INTO ingredient (name, amount, unit, user_name, created_at) VALUE (?, ?, ?, ?, ?)", ingredient.Name, ingredient.Amount, unit, user, ingredient.RegisterDate)

	if err != nil {
		fmt.Println("error : " + err.Error())
		affectRownum, err := result.RowsAffected()
		fmt.Sprintln("affect rows count" + fmt.Sprint(affectRownum) + ", error : " + err.Error())
	}
	res := connect.NewResponse(&grpc.Void{})
	return res, err
}

func (s *RecipeServer) FetchRecipe(ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[grpc.Food], error) {

	recipeName, _ := redisClient.Do(ctx, redisClient.B().Get().Key(req.Msg.Name).Build()).ToString()

	row := db.QueryRow("SELECT id, name, serving, recipe_url FROM recipe WHERE name=?", recipeName)

	var id int
	var name string
	var serving int32
	var referenceUrl string
	row.Scan(&id, &name, &serving, &referenceUrl)

	rows, _ := db.Query("SELECT name, amount, unit  FROM ingredients_for_recipe WHERE id=?", id)

	ingredient := []*grpc.Ingredient{}

	for rows.Next() {
		var n string
		var a float64
		var unitStr string

		rows.Scan(&n, &a, &unitStr)

		unitEnum := *grpc.IngredientUnit_quantity.Enum()
		if unitStr == "grams" {
			unitEnum = *grpc.IngredientUnit_grams.Enum()
		}

		resStruct := &grpc.Ingredient{
			Name:   n,
			Amount: a,
			Unit:   unitEnum,
		}
		ingredient = append(ingredient, resStruct)

	}

	res := connect.NewResponse(&grpc.Food{
		Name:         name,
		Serving:      serving,
		Ingredient:   ingredient,
		ReferenceUrl: referenceUrl,
	})
	return res, nil
}

func (s *RecipeServer) SelectRecipe(ctx context.Context, req *connect.Request[service.Recipe]) (*connect.Response[grpc.Void], error) {
	res := connect.NewResponse(&grpc.Void{})
	return res, nil
}

func (s *RecipeServer) RegisterFoodAsRecipe(ctx context.Context, req *connect.Request[service.Recipe]) (*connect.Response[grpc.Void], error) {
	res := connect.NewResponse(&grpc.Void{})
	return res, nil
}

func (s *RecipeServer) FetchRecommendRecipe(ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[service.RecommendFood], error) {
	resArray := []*grpc.Ingredient{}
	resStruct := &grpc.Ingredient{
		Name:         fmt.Sprintf("hoge"),
		Amount:       1,
		Unit:         0,
		RegisterDate: 0,
	}
	resArray = append(resArray, resStruct)
	foodArray := []*grpc.Food{}
	food := &grpc.Food{
		Name:         fmt.Sprintf("sample_recipe_name"),
		Serving:      1,
		Ingredient:   resArray,
		ReferenceUrl: "hogehoge.com",
	}
	foodArray = append(foodArray, food)
	res := connect.NewResponse(&service.RecommendFood{RecommendFoods: foodArray})
	return res, nil
}

func (s *HcServer) CheckDatabaseStatus(ctx context.Context, req *connect.Request[grpc.Void]) (*connect.Response[service.Status], error) {
	err := db.Ping()
	if err != nil {
		return connect.NewResponse(&service.Status{Status: "disconnect"}), nil
	} else {
		return connect.NewResponse(&service.Status{Status: "ok!"}), nil
	}
}

func main() {

	var err error
	// ローカルで試すときはホスト名を変えること
	db, err = sql.Open("mysql", "root:password@(mysql:3306)/banmeshi")

	defer db.Close()

	if err != nil {
		fmt.Println(err)
		return
	}
	redisClient, err = rueidis.NewClient(rueidis.ClientOption{InitAddress: []string{"redis:6379"}})

	if err != nil {
		panic(err)
	}
	defer redisClient.Close()

	inventoryServer := &InventoryServer{}
	recipeServer := &RecipeServer{}
	hcServer := &HcServer{}
	mux := http.NewServeMux()
	path, handler := serviceconnect.NewInventoryServiceHandler(inventoryServer)
	mux.Handle(path, handler)
	path, handler = serviceconnect.NewRecipeServiceHandler(recipeServer)
	mux.Handle(path, handler)
	path, handler = serviceconnect.NewHelthcheckHandler(hcServer)
	mux.Handle(path, handler)

	corsHandler := cors.New(cors.Options{
		AllowedOrigins:   []string{"http://localhost:*"},
		AllowCredentials: true,
		AllowedHeaders:   []string{"Content-Type", "X-Grpc-Web", "X-User-Agent"},
	}).Handler(mux)

	http.ListenAndServe(
		":8080",
		corsHandler,
	)
}
