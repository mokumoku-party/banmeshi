//
//  Generated code. Do not modify.
//  source: service/recipe_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../food.pb.dart' as $3;
import '../user.pb.dart' as $0;

class RecommendFood extends $pb.GeneratedMessage {
  factory RecommendFood() => create();
  RecommendFood._() : super();
  factory RecommendFood.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecommendFood.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecommendFood', createEmptyInstance: create)
    ..pc<$3.Food>(1, _omitFieldNames ? '' : 'recommendFoods', $pb.PbFieldType.PM, subBuilder: $3.Food.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecommendFood clone() => RecommendFood()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecommendFood copyWith(void Function(RecommendFood) updates) => super.copyWith((message) => updates(message as RecommendFood)) as RecommendFood;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecommendFood create() => RecommendFood._();
  RecommendFood createEmptyInstance() => create();
  static $pb.PbList<RecommendFood> createRepeated() => $pb.PbList<RecommendFood>();
  @$core.pragma('dart2js:noInline')
  static RecommendFood getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecommendFood>(create);
  static RecommendFood? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Food> get recommendFoods => $_getList(0);
}

class Recipe extends $pb.GeneratedMessage {
  factory Recipe() => create();
  Recipe._() : super();
  factory Recipe.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Recipe.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Recipe', createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aOM<$3.Food>(2, _omitFieldNames ? '' : 'food', subBuilder: $3.Food.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Recipe clone() => Recipe()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Recipe copyWith(void Function(Recipe) updates) => super.copyWith((message) => updates(message as Recipe)) as Recipe;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Recipe create() => Recipe._();
  Recipe createEmptyInstance() => create();
  static $pb.PbList<Recipe> createRepeated() => $pb.PbList<Recipe>();
  @$core.pragma('dart2js:noInline')
  static Recipe getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Recipe>(create);
  static Recipe? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.Food get food => $_getN(1);
  @$pb.TagNumber(2)
  set food($3.Food v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFood() => $_has(1);
  @$pb.TagNumber(2)
  void clearFood() => clearField(2);
  @$pb.TagNumber(2)
  $3.Food ensureFood() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
