package main

import (
	"net/http"

	"context"
	"fmt"

	"database/sql"

	"github.com/bufbuild/connect-go"
	"github.com/rs/cors"

	_ "github.com/go-sql-driver/mysql"

	"github.com/mokumoku-party/banmeshi/server/pkg/grpc"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service/serviceconnect"
)

var db *sql.DB

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
	res := connect.NewResponse(&grpc.Void{})
	return res, nil
}

func (s *RecipeServer) FetchRecipe(ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[grpc.Food], error) {
	resArray := []*grpc.Ingredient{}
	resStruct := &grpc.Ingredient{
		Name:         fmt.Sprintf("hoge"),
		Amount:       1,
		Unit:         0,
		RegisterDate: 0,
	}
	resArray = append(resArray, resStruct)
	res := connect.NewResponse(&grpc.Food{
		Name:         fmt.Sprintf("sample_recipe_name"),
		Serving:      1,
		Ingredient:   resArray,
		ReferenceUrl: "hogehoge.com",
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
