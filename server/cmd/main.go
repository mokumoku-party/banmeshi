package main

import (
	"net/http"

	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"fmt"
	"context"

	"github.com/bufbuild/connect-go"

	"github.com/mokumoku-party/banmeshi/server/pkg/grpc"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service"
	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/service/serviceconnect"
)

type InventoryServer struct {}

type RecipeServer struct {}


func (s *InventoryServer) FetchInventory (ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[service.Inventory], error) {
	resArray := []*grpc.Ingredient{}
	resStruct := &grpc.Ingredient{
		Name:fmt.Sprintf("hoge"),
		Amount:1,
		Unit:0,
		RegisterDate:0,
	}
	resArray = append(resArray,resStruct)
	res := connect.NewResponse(&service.Inventory{Ingredients: resArray,
    })
	return res,nil
}

func (s *InventoryServer) AddInventory (ctx context.Context, req *connect.Request[service.Item]) (*connect.Response[grpc.Void], error){
	res := connect.NewResponse(&grpc.Void{})
	return res,nil
}

func (s *RecipeServer) FetchRecipe (ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[grpc.Food],error){
	resArray := []*grpc.Ingredient{}
	resStruct := &grpc.Ingredient{
		Name:fmt.Sprintf("hoge"),
		Amount:1,
		Unit:0,
		RegisterDate:0,
	}
	resArray = append(resArray,resStruct)
	res := connect.NewResponse(&grpc.Food{
		Name: fmt.Sprintf("sample_recipe_name"),
		Serving: 1,
		Ingredient: resArray,
		ReferenceUrl: "hogehoge.com",
		})
	return res,nil
}

func (s *RecipeServer) SelectRecipe (ctx context.Context, req *connect.Request[service.Recipe]) (*connect.Response[grpc.Void],error){
	res := connect.NewResponse(&grpc.Void{})
	return res, nil
}

func (s *RecipeServer) RegisterFoodAsRecipe (ctx context.Context, req *connect.Request[service.Recipe]) (*connect.Response[grpc.Void], error){
	res := connect.NewResponse(&grpc.Void{})
	return res, nil
}

func (s *RecipeServer) FetchRecommendRecipe (ctx context.Context, req *connect.Request[grpc.User]) (*connect.Response[service.RecommendFood], error){
	resArray := []*grpc.Ingredient{}
	resStruct := &grpc.Ingredient{
		Name:fmt.Sprintf("hoge"),
		Amount:1,
		Unit:0,
		RegisterDate:0,
	}
	resArray = append(resArray,resStruct)
	foodArray := []*grpc.Food{}
	food := &grpc.Food{
		Name: fmt.Sprintf("sample_recipe_name"),
		Serving: 1,
		Ingredient: resArray,
		ReferenceUrl: "hogehoge.com",
	}
	foodArray = append(foodArray,food)
	res := connect.NewResponse(&service.RecommendFood{ RecommendFoods: foodArray})
	return res, nil
}

func main() {
	inventoryServer := &InventoryServer{}
	recipeServer := &RecipeServer{}
	mux := http.NewServeMux()
	path, handler := serviceconnect.NewInventoryServiceHandler(inventoryServer)
	mux.Handle(path, handler)
	path, handler = serviceconnect.NewRecipeServiceHandler(recipeServer)
	mux.Handle(path, handler)
	http.ListenAndServe(
		"localhost:8080",
		h2c.NewHandler(mux, &http2.Server{}),
	)
}