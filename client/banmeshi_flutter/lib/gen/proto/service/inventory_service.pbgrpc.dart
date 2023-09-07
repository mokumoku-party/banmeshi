//
//  Generated code. Do not modify.
//  source: service/inventory_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../user.pb.dart' as $0;
import '../void.pb.dart' as $2;
import 'inventory_service.pb.dart' as $1;

export 'inventory_service.pb.dart';

@$pb.GrpcServiceName('InventoryService')
class InventoryServiceClient extends $grpc.Client {
  static final _$fetchInventory = $grpc.ClientMethod<$0.User, $1.Inventory>(
      '/InventoryService/FetchInventory',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Inventory.fromBuffer(value));
  static final _$addInventory = $grpc.ClientMethod<$1.Item, $2.Void>(
      '/InventoryService/AddInventory',
      ($1.Item value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Void.fromBuffer(value));

  InventoryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Inventory> fetchInventory($0.User request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchInventory, request, options: options);
  }

  $grpc.ResponseFuture<$2.Void> addInventory($1.Item request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addInventory, request, options: options);
  }
}

@$pb.GrpcServiceName('InventoryService')
abstract class InventoryServiceBase extends $grpc.Service {
  $core.String get $name => 'InventoryService';

  InventoryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $1.Inventory>(
        'FetchInventory',
        fetchInventory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($1.Inventory value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Item, $2.Void>(
        'AddInventory',
        addInventory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Item.fromBuffer(value),
        ($2.Void value) => value.writeToBuffer()));
  }

  $async.Future<$1.Inventory> fetchInventory_Pre($grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return fetchInventory(call, await request);
  }

  $async.Future<$2.Void> addInventory_Pre($grpc.ServiceCall call, $async.Future<$1.Item> request) async {
    return addInventory(call, await request);
  }

  $async.Future<$1.Inventory> fetchInventory($grpc.ServiceCall call, $0.User request);
  $async.Future<$2.Void> addInventory($grpc.ServiceCall call, $1.Item request);
}
