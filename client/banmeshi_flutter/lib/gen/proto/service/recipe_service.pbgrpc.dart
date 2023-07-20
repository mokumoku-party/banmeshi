//
//  Generated code. Do not modify.
//  source: service/recipe_service.proto
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

import '../food.pb.dart' as $3;
import '../user.pb.dart' as $0;
import '../void.pb.dart' as $2;
import 'recipe_service.pb.dart' as $4;

export 'recipe_service.pb.dart';

@$pb.GrpcServiceName('RecipeService')
class RecipeServiceClient extends $grpc.Client {
  static final _$fetchRecipe = $grpc.ClientMethod<$0.User, $3.Food>(
      '/RecipeService/FetchRecipe',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Food.fromBuffer(value));
  static final _$selectRecipe = $grpc.ClientMethod<$4.Recipe, $2.Void>(
      '/RecipeService/SelectRecipe',
      ($4.Recipe value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Void.fromBuffer(value));
  static final _$registerFoodAsRecipe = $grpc.ClientMethod<$4.Recipe, $2.Void>(
      '/RecipeService/RegisterFoodAsRecipe',
      ($4.Recipe value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Void.fromBuffer(value));
  static final _$fetchRecommendRecipe = $grpc.ClientMethod<$0.User, $4.RecommendFood>(
      '/RecipeService/FetchRecommendRecipe',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.RecommendFood.fromBuffer(value));

  RecipeServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.Food> fetchRecipe($0.User request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchRecipe, request, options: options);
  }

  $grpc.ResponseFuture<$2.Void> selectRecipe($4.Recipe request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$selectRecipe, request, options: options);
  }

  $grpc.ResponseFuture<$2.Void> registerFoodAsRecipe($4.Recipe request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerFoodAsRecipe, request, options: options);
  }

  $grpc.ResponseFuture<$4.RecommendFood> fetchRecommendRecipe($0.User request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchRecommendRecipe, request, options: options);
  }
}

@$pb.GrpcServiceName('RecipeService')
abstract class RecipeServiceBase extends $grpc.Service {
  $core.String get $name => 'RecipeService';

  RecipeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $3.Food>(
        'FetchRecipe',
        fetchRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($3.Food value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.Recipe, $2.Void>(
        'SelectRecipe',
        selectRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.Recipe.fromBuffer(value),
        ($2.Void value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.Recipe, $2.Void>(
        'RegisterFoodAsRecipe',
        registerFoodAsRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.Recipe.fromBuffer(value),
        ($2.Void value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $4.RecommendFood>(
        'FetchRecommendRecipe',
        fetchRecommendRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($4.RecommendFood value) => value.writeToBuffer()));
  }

  $async.Future<$3.Food> fetchRecipe_Pre($grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return fetchRecipe(call, await request);
  }

  $async.Future<$2.Void> selectRecipe_Pre($grpc.ServiceCall call, $async.Future<$4.Recipe> request) async {
    return selectRecipe(call, await request);
  }

  $async.Future<$2.Void> registerFoodAsRecipe_Pre($grpc.ServiceCall call, $async.Future<$4.Recipe> request) async {
    return registerFoodAsRecipe(call, await request);
  }

  $async.Future<$4.RecommendFood> fetchRecommendRecipe_Pre($grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return fetchRecommendRecipe(call, await request);
  }

  $async.Future<$3.Food> fetchRecipe($grpc.ServiceCall call, $0.User request);
  $async.Future<$2.Void> selectRecipe($grpc.ServiceCall call, $4.Recipe request);
  $async.Future<$2.Void> registerFoodAsRecipe($grpc.ServiceCall call, $4.Recipe request);
  $async.Future<$4.RecommendFood> fetchRecommendRecipe($grpc.ServiceCall call, $0.User request);
}
