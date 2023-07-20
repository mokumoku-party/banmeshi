// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        (unknown)
// source: ingredient.proto

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

type IngredientUnit int32

const (
	IngredientUnit_quantity IngredientUnit = 0
	IngredientUnit_grams    IngredientUnit = 1
)

// Enum value maps for IngredientUnit.
var (
	IngredientUnit_name = map[int32]string{
		0: "quantity",
		1: "grams",
	}
	IngredientUnit_value = map[string]int32{
		"quantity": 0,
		"grams":    1,
	}
)

func (x IngredientUnit) Enum() *IngredientUnit {
	p := new(IngredientUnit)
	*p = x
	return p
}

func (x IngredientUnit) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (IngredientUnit) Descriptor() protoreflect.EnumDescriptor {
	return file_ingredient_proto_enumTypes[0].Descriptor()
}

func (IngredientUnit) Type() protoreflect.EnumType {
	return &file_ingredient_proto_enumTypes[0]
}

func (x IngredientUnit) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use IngredientUnit.Descriptor instead.
func (IngredientUnit) EnumDescriptor() ([]byte, []int) {
	return file_ingredient_proto_rawDescGZIP(), []int{0}
}

// 食材
type Ingredient struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// 食材名
	Name string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	// 数量
	Amount float64 `protobuf:"fixed64,2,opt,name=amount,proto3" json:"amount,omitempty"`
	// 単位
	Unit IngredientUnit `protobuf:"varint,3,opt,name=unit,proto3,enum=IngredientUnit" json:"unit,omitempty"`
	// 登録した日にち
	RegisterDate int64 `protobuf:"varint,4,opt,name=register_date,json=registerDate,proto3" json:"register_date,omitempty"`
}

func (x *Ingredient) Reset() {
	*x = Ingredient{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ingredient_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Ingredient) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Ingredient) ProtoMessage() {}

func (x *Ingredient) ProtoReflect() protoreflect.Message {
	mi := &file_ingredient_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Ingredient.ProtoReflect.Descriptor instead.
func (*Ingredient) Descriptor() ([]byte, []int) {
	return file_ingredient_proto_rawDescGZIP(), []int{0}
}

func (x *Ingredient) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *Ingredient) GetAmount() float64 {
	if x != nil {
		return x.Amount
	}
	return 0
}

func (x *Ingredient) GetUnit() IngredientUnit {
	if x != nil {
		return x.Unit
	}
	return IngredientUnit_quantity
}

func (x *Ingredient) GetRegisterDate() int64 {
	if x != nil {
		return x.RegisterDate
	}
	return 0
}

var File_ingredient_proto protoreflect.FileDescriptor

var file_ingredient_proto_rawDesc = []byte{
	0x0a, 0x10, 0x69, 0x6e, 0x67, 0x72, 0x65, 0x64, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x22, 0x82, 0x01, 0x0a, 0x0a, 0x49, 0x6e, 0x67, 0x72, 0x65, 0x64, 0x69, 0x65, 0x6e,
	0x74, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x61, 0x6d, 0x6f, 0x75, 0x6e, 0x74, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x01, 0x52, 0x06, 0x61, 0x6d, 0x6f, 0x75, 0x6e, 0x74, 0x12, 0x23, 0x0a,
	0x04, 0x75, 0x6e, 0x69, 0x74, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x0f, 0x2e, 0x49, 0x6e,
	0x67, 0x72, 0x65, 0x64, 0x69, 0x65, 0x6e, 0x74, 0x55, 0x6e, 0x69, 0x74, 0x52, 0x04, 0x75, 0x6e,
	0x69, 0x74, 0x12, 0x23, 0x0a, 0x0d, 0x72, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0x72, 0x5f, 0x64,
	0x61, 0x74, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0c, 0x72, 0x65, 0x67, 0x69, 0x73,
	0x74, 0x65, 0x72, 0x44, 0x61, 0x74, 0x65, 0x2a, 0x29, 0x0a, 0x0e, 0x49, 0x6e, 0x67, 0x72, 0x65,
	0x64, 0x69, 0x65, 0x6e, 0x74, 0x55, 0x6e, 0x69, 0x74, 0x12, 0x0c, 0x0a, 0x08, 0x71, 0x75, 0x61,
	0x6e, 0x74, 0x69, 0x74, 0x79, 0x10, 0x00, 0x12, 0x09, 0x0a, 0x05, 0x67, 0x72, 0x61, 0x6d, 0x73,
	0x10, 0x01, 0x42, 0x11, 0x5a, 0x0f, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x2f, 0x70, 0x6b, 0x67,
	0x2f, 0x67, 0x72, 0x70, 0x63, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_ingredient_proto_rawDescOnce sync.Once
	file_ingredient_proto_rawDescData = file_ingredient_proto_rawDesc
)

func file_ingredient_proto_rawDescGZIP() []byte {
	file_ingredient_proto_rawDescOnce.Do(func() {
		file_ingredient_proto_rawDescData = protoimpl.X.CompressGZIP(file_ingredient_proto_rawDescData)
	})
	return file_ingredient_proto_rawDescData
}

var file_ingredient_proto_enumTypes = make([]protoimpl.EnumInfo, 1)
var file_ingredient_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_ingredient_proto_goTypes = []interface{}{
	(IngredientUnit)(0), // 0: IngredientUnit
	(*Ingredient)(nil),  // 1: Ingredient
}
var file_ingredient_proto_depIdxs = []int32{
	0, // 0: Ingredient.unit:type_name -> IngredientUnit
	1, // [1:1] is the sub-list for method output_type
	1, // [1:1] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_ingredient_proto_init() }
func file_ingredient_proto_init() {
	if File_ingredient_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_ingredient_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Ingredient); i {
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
			RawDescriptor: file_ingredient_proto_rawDesc,
			NumEnums:      1,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_ingredient_proto_goTypes,
		DependencyIndexes: file_ingredient_proto_depIdxs,
		EnumInfos:         file_ingredient_proto_enumTypes,
		MessageInfos:      file_ingredient_proto_msgTypes,
	}.Build()
	File_ingredient_proto = out.File
	file_ingredient_proto_rawDesc = nil
	file_ingredient_proto_goTypes = nil
	file_ingredient_proto_depIdxs = nil
}