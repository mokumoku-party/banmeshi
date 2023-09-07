//
//  Generated code. Do not modify.
//  source: ingredient.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class IngredientUnit extends $pb.ProtobufEnum {
  static const IngredientUnit quantity = IngredientUnit._(0, _omitEnumNames ? '' : 'quantity');
  static const IngredientUnit grams = IngredientUnit._(1, _omitEnumNames ? '' : 'grams');

  static const $core.List<IngredientUnit> values = <IngredientUnit> [
    quantity,
    grams,
  ];

  static final $core.Map<$core.int, IngredientUnit> _byValue = $pb.ProtobufEnum.initByValue(values);
  static IngredientUnit? valueOf($core.int value) => _byValue[value];

  const IngredientUnit._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
