//
//  Generated code. Do not modify.
//  source: ingredient.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'ingredient.pbenum.dart';

export 'ingredient.pbenum.dart';

/// 食材
class Ingredient extends $pb.GeneratedMessage {
  factory Ingredient({
    $core.String? name,
    $core.double? amount,
    IngredientUnit? unit,
    $fixnum.Int64? registerDate,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (unit != null) {
      $result.unit = unit;
    }
    if (registerDate != null) {
      $result.registerDate = registerDate;
    }
    return $result;
  }
  Ingredient._() : super();
  factory Ingredient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ingredient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ingredient', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..e<IngredientUnit>(3, _omitFieldNames ? '' : 'unit', $pb.PbFieldType.OE, defaultOrMaker: IngredientUnit.unknown, valueOf: IngredientUnit.valueOf, enumValues: IngredientUnit.values)
    ..aInt64(4, _omitFieldNames ? '' : 'registerDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ingredient clone() => Ingredient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ingredient copyWith(void Function(Ingredient) updates) => super.copyWith((message) => updates(message as Ingredient)) as Ingredient;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ingredient create() => Ingredient._();
  Ingredient createEmptyInstance() => create();
  static $pb.PbList<Ingredient> createRepeated() => $pb.PbList<Ingredient>();
  @$core.pragma('dart2js:noInline')
  static Ingredient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ingredient>(create);
  static Ingredient? _defaultInstance;

  /// 食材名
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// 数量
  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  /// 単位
  @$pb.TagNumber(3)
  IngredientUnit get unit => $_getN(2);
  @$pb.TagNumber(3)
  set unit(IngredientUnit v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnit() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnit() => clearField(3);

  /// 登録した日にち
  @$pb.TagNumber(4)
  $fixnum.Int64 get registerDate => $_getI64(3);
  @$pb.TagNumber(4)
  set registerDate($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRegisterDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegisterDate() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
