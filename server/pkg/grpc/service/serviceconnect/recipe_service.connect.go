// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: service/recipe_service.proto

package serviceconnect

import (
	context "context"
	errors "errors"
	connect_go "github.com/bufbuild/connect-go"
	grpc "github.com/mokumoku-party/banmeshi/server/pkg/grpc"
	service "github.com/mokumoku-party/banmeshi/server/pkg/grpc/service"
	http "net/http"
	strings "strings"
)

// This is a compile-time assertion to ensure that this generated file and the connect package are
// compatible. If you get a compiler error that this constant is not defined, this code was
// generated with a version of connect newer than the one compiled into your binary. You can fix the
// problem by either regenerating this code with an older version of connect or updating the connect
// version compiled into your binary.
const _ = connect_go.IsAtLeastVersion0_1_0

const (
	// RecipeServiceName is the fully-qualified name of the RecipeService service.
	RecipeServiceName = "RecipeService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// RecipeServiceFetchRecipeProcedure is the fully-qualified name of the RecipeService's FetchRecipe
	// RPC.
	RecipeServiceFetchRecipeProcedure = "/RecipeService/FetchRecipe"
	// RecipeServiceSelectRecipeProcedure is the fully-qualified name of the RecipeService's
	// SelectRecipe RPC.
	RecipeServiceSelectRecipeProcedure = "/RecipeService/SelectRecipe"
	// RecipeServiceRegisterFoodAsRecipeProcedure is the fully-qualified name of the RecipeService's
	// RegisterFoodAsRecipe RPC.
	RecipeServiceRegisterFoodAsRecipeProcedure = "/RecipeService/RegisterFoodAsRecipe"
	// RecipeServiceFetchRecommendRecipeProcedure is the fully-qualified name of the RecipeService's
	// FetchRecommendRecipe RPC.
	RecipeServiceFetchRecommendRecipeProcedure = "/RecipeService/FetchRecommendRecipe"
)

// RecipeServiceClient is a client for the RecipeService service.
type RecipeServiceClient interface {
	// ユーザが作る予定のレシピを取得
	FetchRecipe(context.Context, *connect_go.Request[grpc.User]) (*connect_go.Response[grpc.Food], error)
	// ユーザが作るレシピを設定
	SelectRecipe(context.Context, *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error)
	// 作った料理をレシピとして登録
	RegisterFoodAsRecipe(context.Context, *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error)
	// レシピのリコメンドを取得
	FetchRecommendRecipe(context.Context, *connect_go.Request[grpc.User]) (*connect_go.Response[service.RecommendFood], error)
}

// NewRecipeServiceClient constructs a client for the RecipeService service. By default, it uses the
// Connect protocol with the binary Protobuf Codec, asks for gzipped responses, and sends
// uncompressed requests. To use the gRPC or gRPC-Web protocols, supply the connect.WithGRPC() or
// connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewRecipeServiceClient(httpClient connect_go.HTTPClient, baseURL string, opts ...connect_go.ClientOption) RecipeServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	return &recipeServiceClient{
		fetchRecipe: connect_go.NewClient[grpc.User, grpc.Food](
			httpClient,
			baseURL+RecipeServiceFetchRecipeProcedure,
			opts...,
		),
		selectRecipe: connect_go.NewClient[service.Recipe, grpc.Void](
			httpClient,
			baseURL+RecipeServiceSelectRecipeProcedure,
			opts...,
		),
		registerFoodAsRecipe: connect_go.NewClient[service.Recipe, grpc.Void](
			httpClient,
			baseURL+RecipeServiceRegisterFoodAsRecipeProcedure,
			opts...,
		),
		fetchRecommendRecipe: connect_go.NewClient[grpc.User, service.RecommendFood](
			httpClient,
			baseURL+RecipeServiceFetchRecommendRecipeProcedure,
			opts...,
		),
	}
}

// recipeServiceClient implements RecipeServiceClient.
type recipeServiceClient struct {
	fetchRecipe          *connect_go.Client[grpc.User, grpc.Food]
	selectRecipe         *connect_go.Client[service.Recipe, grpc.Void]
	registerFoodAsRecipe *connect_go.Client[service.Recipe, grpc.Void]
	fetchRecommendRecipe *connect_go.Client[grpc.User, service.RecommendFood]
}

// FetchRecipe calls RecipeService.FetchRecipe.
func (c *recipeServiceClient) FetchRecipe(ctx context.Context, req *connect_go.Request[grpc.User]) (*connect_go.Response[grpc.Food], error) {
	return c.fetchRecipe.CallUnary(ctx, req)
}

// SelectRecipe calls RecipeService.SelectRecipe.
func (c *recipeServiceClient) SelectRecipe(ctx context.Context, req *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error) {
	return c.selectRecipe.CallUnary(ctx, req)
}

// RegisterFoodAsRecipe calls RecipeService.RegisterFoodAsRecipe.
func (c *recipeServiceClient) RegisterFoodAsRecipe(ctx context.Context, req *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error) {
	return c.registerFoodAsRecipe.CallUnary(ctx, req)
}

// FetchRecommendRecipe calls RecipeService.FetchRecommendRecipe.
func (c *recipeServiceClient) FetchRecommendRecipe(ctx context.Context, req *connect_go.Request[grpc.User]) (*connect_go.Response[service.RecommendFood], error) {
	return c.fetchRecommendRecipe.CallUnary(ctx, req)
}

// RecipeServiceHandler is an implementation of the RecipeService service.
type RecipeServiceHandler interface {
	// ユーザが作る予定のレシピを取得
	FetchRecipe(context.Context, *connect_go.Request[grpc.User]) (*connect_go.Response[grpc.Food], error)
	// ユーザが作るレシピを設定
	SelectRecipe(context.Context, *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error)
	// 作った料理をレシピとして登録
	RegisterFoodAsRecipe(context.Context, *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error)
	// レシピのリコメンドを取得
	FetchRecommendRecipe(context.Context, *connect_go.Request[grpc.User]) (*connect_go.Response[service.RecommendFood], error)
}

// NewRecipeServiceHandler builds an HTTP handler from the service implementation. It returns the
// path on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewRecipeServiceHandler(svc RecipeServiceHandler, opts ...connect_go.HandlerOption) (string, http.Handler) {
	recipeServiceFetchRecipeHandler := connect_go.NewUnaryHandler(
		RecipeServiceFetchRecipeProcedure,
		svc.FetchRecipe,
		opts...,
	)
	recipeServiceSelectRecipeHandler := connect_go.NewUnaryHandler(
		RecipeServiceSelectRecipeProcedure,
		svc.SelectRecipe,
		opts...,
	)
	recipeServiceRegisterFoodAsRecipeHandler := connect_go.NewUnaryHandler(
		RecipeServiceRegisterFoodAsRecipeProcedure,
		svc.RegisterFoodAsRecipe,
		opts...,
	)
	recipeServiceFetchRecommendRecipeHandler := connect_go.NewUnaryHandler(
		RecipeServiceFetchRecommendRecipeProcedure,
		svc.FetchRecommendRecipe,
		opts...,
	)
	return "/RecipeService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case RecipeServiceFetchRecipeProcedure:
			recipeServiceFetchRecipeHandler.ServeHTTP(w, r)
		case RecipeServiceSelectRecipeProcedure:
			recipeServiceSelectRecipeHandler.ServeHTTP(w, r)
		case RecipeServiceRegisterFoodAsRecipeProcedure:
			recipeServiceRegisterFoodAsRecipeHandler.ServeHTTP(w, r)
		case RecipeServiceFetchRecommendRecipeProcedure:
			recipeServiceFetchRecommendRecipeHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedRecipeServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedRecipeServiceHandler struct{}

func (UnimplementedRecipeServiceHandler) FetchRecipe(context.Context, *connect_go.Request[grpc.User]) (*connect_go.Response[grpc.Food], error) {
	return nil, connect_go.NewError(connect_go.CodeUnimplemented, errors.New("RecipeService.FetchRecipe is not implemented"))
}

func (UnimplementedRecipeServiceHandler) SelectRecipe(context.Context, *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error) {
	return nil, connect_go.NewError(connect_go.CodeUnimplemented, errors.New("RecipeService.SelectRecipe is not implemented"))
}

func (UnimplementedRecipeServiceHandler) RegisterFoodAsRecipe(context.Context, *connect_go.Request[service.Recipe]) (*connect_go.Response[grpc.Void], error) {
	return nil, connect_go.NewError(connect_go.CodeUnimplemented, errors.New("RecipeService.RegisterFoodAsRecipe is not implemented"))
}

func (UnimplementedRecipeServiceHandler) FetchRecommendRecipe(context.Context, *connect_go.Request[grpc.User]) (*connect_go.Response[service.RecommendFood], error) {
	return nil, connect_go.NewError(connect_go.CodeUnimplemented, errors.New("RecipeService.FetchRecommendRecipe is not implemented"))
}
