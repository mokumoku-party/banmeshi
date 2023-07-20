// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        (unknown)
// source: service/recipe_service.proto

package grpc

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type RecommendFood struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	RecommendFoods []*Food `protobuf:"bytes,1,rep,name=recommend_foods,json=recommendFoods,proto3" json:"recommend_foods,omitempty"`
}

func (x *RecommendFood) Reset() {
	*x = RecommendFood{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_recipe_service_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RecommendFood) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RecommendFood) ProtoMessage() {}

func (x *RecommendFood) ProtoReflect() protoreflect.Message {
	mi := &file_service_recipe_service_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RecommendFood.ProtoReflect.Descriptor instead.
func (*RecommendFood) Descriptor() ([]byte, []int) {
	return file_service_recipe_service_proto_rawDescGZIP(), []int{0}
}

func (x *RecommendFood) GetRecommendFoods() []*Food {
	if x != nil {
		return x.RecommendFoods
	}
	return nil
}

type Recipe struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	User *User `protobuf:"bytes,1,opt,name=user,proto3" json:"user,omitempty"`
	Food *Food `protobuf:"bytes,2,opt,name=food,proto3" json:"food,omitempty"`
}

func (x *Recipe) Reset() {
	*x = Recipe{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_recipe_service_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Recipe) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Recipe) ProtoMessage() {}

func (x *Recipe) ProtoReflect() protoreflect.Message {
	mi := &file_service_recipe_service_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Recipe.ProtoReflect.Descriptor instead.
func (*Recipe) Descriptor() ([]byte, []int) {
	return file_service_recipe_service_proto_rawDescGZIP(), []int{1}
}

func (x *Recipe) GetUser() *User {
	if x != nil {
		return x.User
	}
	return nil
}

func (x *Recipe) GetFood() *Food {
	if x != nil {
		return x.Food
	}
	return nil
}

var File_service_recipe_service_proto protoreflect.FileDescriptor

var file_service_recipe_service_proto_rawDesc = []byte{
	0x0a, 0x1c, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2f, 0x72, 0x65, 0x63, 0x69, 0x70, 0x65,
	0x5f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0a,
	0x75, 0x73, 0x65, 0x72, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0a, 0x66, 0x6f, 0x6f, 0x64,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0a, 0x76, 0x6f, 0x69, 0x64, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x22, 0x3f, 0x0a, 0x0d, 0x52, 0x65, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x64, 0x46,
	0x6f, 0x6f, 0x64, 0x12, 0x2e, 0x0a, 0x0f, 0x72, 0x65, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x64,
	0x5f, 0x66, 0x6f, 0x6f, 0x64, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x05, 0x2e, 0x46,
	0x6f, 0x6f, 0x64, 0x52, 0x0e, 0x72, 0x65, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x64, 0x46, 0x6f,
	0x6f, 0x64, 0x73, 0x22, 0x3e, 0x0a, 0x06, 0x52, 0x65, 0x63, 0x69, 0x70, 0x65, 0x12, 0x19, 0x0a,
	0x04, 0x75, 0x73, 0x65, 0x72, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x05, 0x2e, 0x55, 0x73,
	0x65, 0x72, 0x52, 0x04, 0x75, 0x73, 0x65, 0x72, 0x12, 0x19, 0x0a, 0x04, 0x66, 0x6f, 0x6f, 0x64,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x05, 0x2e, 0x46, 0x6f, 0x6f, 0x64, 0x52, 0x04, 0x66,
	0x6f, 0x6f, 0x64, 0x32, 0xa7, 0x01, 0x0a, 0x0d, 0x52, 0x65, 0x63, 0x69, 0x70, 0x65, 0x53, 0x65,
	0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x1b, 0x0a, 0x0b, 0x46, 0x65, 0x74, 0x63, 0x68, 0x52, 0x65,
	0x63, 0x69, 0x70, 0x65, 0x12, 0x05, 0x2e, 0x55, 0x73, 0x65, 0x72, 0x1a, 0x05, 0x2e, 0x46, 0x6f,
	0x6f, 0x64, 0x12, 0x20, 0x0a, 0x0c, 0x53, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x52, 0x65, 0x63, 0x69,
	0x70, 0x65, 0x12, 0x07, 0x2e, 0x52, 0x65, 0x63, 0x69, 0x70, 0x65, 0x1a, 0x05, 0x2e, 0x56, 0x6f,
	0x69, 0x64, 0x22, 0x00, 0x12, 0x28, 0x0a, 0x14, 0x52, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0x72,
	0x46, 0x6f, 0x6f, 0x64, 0x41, 0x73, 0x52, 0x65, 0x63, 0x69, 0x70, 0x65, 0x12, 0x07, 0x2e, 0x52,
	0x65, 0x63, 0x69, 0x70, 0x65, 0x1a, 0x05, 0x2e, 0x56, 0x6f, 0x69, 0x64, 0x22, 0x00, 0x12, 0x2d,
	0x0a, 0x14, 0x46, 0x65, 0x74, 0x63, 0x68, 0x52, 0x65, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x64,
	0x52, 0x65, 0x63, 0x69, 0x70, 0x65, 0x12, 0x05, 0x2e, 0x55, 0x73, 0x65, 0x72, 0x1a, 0x0e, 0x2e,
	0x52, 0x65, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x64, 0x46, 0x6f, 0x6f, 0x64, 0x42, 0x11, 0x5a,
	0x0f, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x2f, 0x70, 0x6b, 0x67, 0x2f, 0x67, 0x72, 0x70, 0x63,
	0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_service_recipe_service_proto_rawDescOnce sync.Once
	file_service_recipe_service_proto_rawDescData = file_service_recipe_service_proto_rawDesc
)

func file_service_recipe_service_proto_rawDescGZIP() []byte {
	file_service_recipe_service_proto_rawDescOnce.Do(func() {
		file_service_recipe_service_proto_rawDescData = protoimpl.X.CompressGZIP(file_service_recipe_service_proto_rawDescData)
	})
	return file_service_recipe_service_proto_rawDescData
}

var file_service_recipe_service_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_service_recipe_service_proto_goTypes = []interface{}{
	(*RecommendFood)(nil), // 0: RecommendFood
	(*Recipe)(nil),        // 1: Recipe
	(*Food)(nil),          // 2: Food
	(*User)(nil),          // 3: User
	(*Void)(nil),          // 4: Void
}
var file_service_recipe_service_proto_depIdxs = []int32{
	2, // 0: RecommendFood.recommend_foods:type_name -> Food
	3, // 1: Recipe.user:type_name -> User
	2, // 2: Recipe.food:type_name -> Food
	3, // 3: RecipeService.FetchRecipe:input_type -> User
	1, // 4: RecipeService.SelectRecipe:input_type -> Recipe
	1, // 5: RecipeService.RegisterFoodAsRecipe:input_type -> Recipe
	3, // 6: RecipeService.FetchRecommendRecipe:input_type -> User
	2, // 7: RecipeService.FetchRecipe:output_type -> Food
	4, // 8: RecipeService.SelectRecipe:output_type -> Void
	4, // 9: RecipeService.RegisterFoodAsRecipe:output_type -> Void
	0, // 10: RecipeService.FetchRecommendRecipe:output_type -> RecommendFood
	7, // [7:11] is the sub-list for method output_type
	3, // [3:7] is the sub-list for method input_type
	3, // [3:3] is the sub-list for extension type_name
	3, // [3:3] is the sub-list for extension extendee
	0, // [0:3] is the sub-list for field type_name
}

func init() { file_service_recipe_service_proto_init() }
func file_service_recipe_service_proto_init() {
	if File_service_recipe_service_proto != nil {
		return
	}
	file_user_proto_init()
	file_food_proto_init()
	file_void_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_service_recipe_service_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RecommendFood); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_service_recipe_service_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Recipe); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_service_recipe_service_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_service_recipe_service_proto_goTypes,
		DependencyIndexes: file_service_recipe_service_proto_depIdxs,
		MessageInfos:      file_service_recipe_service_proto_msgTypes,
	}.Build()
	File_service_recipe_service_proto = out.File
	file_service_recipe_service_proto_rawDesc = nil
	file_service_recipe_service_proto_goTypes = nil
	file_service_recipe_service_proto_depIdxs = nil
}
