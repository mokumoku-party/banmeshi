package main

import (
	"net/http"
	"os"

	"context"
	"fmt"

	"database/sql"

	"github.com/bufbuild/connect-go"
	"github.com/rs/cors"
	"golang.org/x/exp/slog"

	"github.com/redis/rueidis"

	_ "github.com/go-sql-driver/mysql"

	"github.com/mokumoku-party/banmeshi/server/pkg/grpc"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service/serviceconnect"
)

var db *sql.DB
var redisClient rueidis.Client
var logger *slog.Logger

type InventoryServer struct{}

type RecipeServer struct{}

type HcServer struct{}

func (s *InventoryServer) FetchInventory(ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[service.Inventory], error) {
	rows, err := db.Query("select name, amount, unit, created_at from ingredient where user_name=?", req.Msg.Name)
	if err != nil {
		logger.Error("database error on FetchInventory")
		logger.Error(err.Error())
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
	logger.Info("FetchInventory success")
	return res, err
}

func (s *InventoryServer) AddInventory(ctx context.Context, req *connect.Request[service.Item]) (*connect.Response[grpc.Void], error) {
	user := req.Msg.User.Name
	ingredient := req.Msg.Ingredient
	unitMap := grpc.IngredientUnit_name
	unit := unitMap[int32(ingredient.Unit)]
	result, err := db.Exec("INSERT INTO ingredient (name, amount, unit, user_name, created_at) VALUE (?, ?, ?, ?, ?)", ingredient.Name, ingredient.Amount, unit, user, ingredient.RegisterDate)

	if err != nil {
		logger.Error("database error on AddInventory")
		logger.Error("error : " + err.Error())
		affectRownum, err := result.RowsAffected()
		logger.Error("affect rows count" + fmt.Sprint(affectRownum) + ", error : " + err.Error())
	}
	res := connect.NewResponse(&grpc.Void{})
	logger.Info("AddInventory success")
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

	rows, err := db.Query("SELECT name, amount, unit  FROM ingredients_for_recipe WHERE id=?", id)

	if err != nil {
		logger.Error("database error on FetchRecipe")
		logger.Error(err.Error())
	}

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
	logger.Info("FetchRecipe success")
	return res, nil
}

func (s *RecipeServer) SelectRecipe(ctx context.Context, req *connect.Request[service.Recipe]) (*connect.Response[grpc.Void], error) {
	err := redisClient.Do(ctx, redisClient.B().Set().Key(req.Msg.User.Name).Value(req.Msg.Food.Name).Build()).Error()
	if err != nil {
		logger.Error("redis error on SelectRecipe")
		logger.Error(err.Error())
	}
	res := connect.NewResponse(&grpc.Void{})
	logger.Info("SelectRecipe success")
	return res, err
}

func (s *RecipeServer) RegisterFoodAsRecipe(ctx context.Context, req *connect.Request[service.Recipe]) (*connect.Response[grpc.Void], error) {
	food := req.Msg.Food
	result, err := db.Exec("INSERT INTO recipe (name, serving, recipe_url) VALUE (?, ?, ?)", food.Name, food.Serving, food.ReferenceUrl)
	if err != nil {
		logger.Error(err.Error())
	}
	id, _ := result.LastInsertId()
	for _, e := range food.Ingredient {
		result, err = db.Exec("INSERT INTO ingredients_for_recipe (name, amount, unit, recipe_id) VALUES (?, ?, ?, ?)", e.Name, e.Amount, grpc.IngredientUnit_name[int32(e.Unit)], id)
		if err != nil {
			logger.Error("insert error on RegisterFoodAsRecipe" + err.Error())
		}
	}
	res := connect.NewResponse(&grpc.Void{})
	logger.Info("RegisterFoodAsRecipe success")
	return res, nil
}

func (s *RecipeServer) FetchRecommendRecipe(ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[service.RecommendFood], error) {

	// 本来は適当なアルゴリズムでリコメンドを返すべきだけど、一旦全件返すようにする

	rows, err := db.Query("SELECT id, name, serving, recipe_url FROM recipe")

	if err != nil {
		logger.Error("database error on FetchRecommendRecie")
		logger.Error("Query : SELECT id, name, serving, recipe_url FROM recipe")
		logger.Error(err.Error())
	}

	foodArray := []*grpc.Food{}

	for rows.Next() {
		var id int
		var recipeName string
		var serving int32
		var referenceUrl string
		rows.Scan(&id, &recipeName, &serving, &referenceUrl)

		rowsFromIngredientTable, err := db.Query("SELECT name, amount, unit FROM ingredients_for_recipe WHERE recipe_id=?", id)

		if err != nil {
			logger.Error("database error on FetchRecommendRecie")
			logger.Error("Query : SELECT name, amount, unit FROM ingredients_for_recipe WHERE recipe_id=?")
			logger.Error(err.Error())
		}

		ingredientArray := []*grpc.Ingredient{}

		for rowsFromIngredientTable.Next() {
			var ingredientName string
			var amount float64
			var unit string
			rowsFromIngredientTable.Scan(&ingredientName, &amount, &unit)
			unitEnum := *grpc.IngredientUnit_quantity.Enum()
			if unit == "grams" {
				unitEnum = *grpc.IngredientUnit_grams.Enum()
			}
			ingredient := &grpc.Ingredient{
				Name:   ingredientName,
				Amount: amount,
				Unit:   unitEnum,
			}
			ingredientArray = append(ingredientArray, ingredient)

		}
		food := &grpc.Food{
			Name:         recipeName,
			Serving:      serving,
			Ingredient:   ingredientArray,
			ReferenceUrl: referenceUrl,
		}
		foodArray = append(foodArray, food)
	}
	res := connect.NewResponse(&service.RecommendFood{RecommendFoods: foodArray})
	logger.Info("FetchRecommendRecipe success")
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

	file, _ := os.Create("server.log")
	logger := slog.New(slog.NewTextHandler(file, nil))
	var err error
	// ローカルで試すときはホスト名を変えること
	db, err = sql.Open("mysql", "root:password@(mysql:3306)/banmeshi")

	defer db.Close()

	if err != nil {
		logger.Error(err.Error())
		return
	}
	redisClient, err = rueidis.NewClient(rueidis.ClientOption{InitAddress: []string{"redis:6379"}})

	if err != nil {
		logger.Error(err.Error())
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
	logger.Info("server started")

	http.ListenAndServe(
		":8080",
		corsHandler,
	)
}
