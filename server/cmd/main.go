package main

import (
	"net/http"

	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"fmt"

	"github.com/mokumoku-party/banmeshi/server/pkg/grpc/grpcconnect"
)

type InventoryServer struct {
	grpcconnect.UnimplementedInventoryServiceHandler
}

func main() {
	inventoryServer := &InventoryServer{}
	fmt.Printf("hoge")

	mux := http.NewServeMux()
	path, handler := grpcconnect.NewInventoryServiceHandler(inventoryServer)
	mux.Handle(path, handler)
	http.ListenAndServe(
		"localhost:8080",
		h2c.NewHandler(mux, &http2.Server{}),
	)
}
