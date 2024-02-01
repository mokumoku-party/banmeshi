//
//  Generated code. Do not modify.
//  source: food.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ingredient.pb.dart' as $0;

/// 料理
class Food extends $pb.GeneratedMessage {
  factory Food({
    $core.String? name,
    $core.int? serving,
    $core.Iterable<$0.Ingredient>? ingredient,
    $core.String? referenceUrl,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (serving != null) {
      $result.serving = serving;
    }
    if (ingredient != null) {
      $result.ingredient.addAll(ingredient);
    }
    if (referenceUrl != null) {
      $result.referenceUrl = referenceUrl;
    }
    return $result;
  }
  Food._() : super();
  factory Food.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Food.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Food', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'serving', $pb.PbFieldType.O3)
    ..pc<$0.Ingredient>(3, _omitFieldNames ? '' : 'ingredient', $pb.PbFieldType.PM, subBuilder: $0.Ingredient.create)
    ..aOS(4, _omitFieldNames ? '' : 'referenceUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Food clone() => Food()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Food copyWith(void Function(Food) updates) => super.copyWith((message) => updates(message as Food)) as Food;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Food create() => Food._();
  Food createEmptyInstance() => create();
  static $pb.PbList<Food> createRepeated() => $pb.PbList<Food>();
  @$core.pragma('dart2js:noInline')
  static Food getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Food>(create);
  static Food? _defaultInstance;

  /// 料理名
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// 何人前
  @$pb.TagNumber(2)
  $core.int get serving => $_getIZ(1);
  @$pb.TagNumber(2)
  set serving($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServing() => $_has(1);
  @$pb.TagNumber(2)
  void clearServing() => clearField(2);

  /// 必要な食材リスト
  @$pb.TagNumber(3)
  $core.List<$0.Ingredient> get ingredient => $_getList(2);

  /// レシピのURL
  @$pb.TagNumber(4)
  $core.String get referenceUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set referenceUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReferenceUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearReferenceUrl() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
