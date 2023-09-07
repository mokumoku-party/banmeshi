//
//  Generated code. Do not modify.
//  source: ingredient.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ingredientUnitDescriptor instead')
const IngredientUnit$json = {
  '1': 'IngredientUnit',
  '2': [
    {'1': 'quantity', '2': 0},
    {'1': 'grams', '2': 1},
  ],
};

/// Descriptor for `IngredientUnit`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ingredientUnitDescriptor = $convert.base64Decode(
    'Cg5JbmdyZWRpZW50VW5pdBIMCghxdWFudGl0eRAAEgkKBWdyYW1zEAE=');

@$core.Deprecated('Use ingredientDescriptor instead')
const Ingredient$json = {
  '1': 'Ingredient',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'unit', '3': 3, '4': 1, '5': 14, '6': '.IngredientUnit', '10': 'unit'},
    {'1': 'register_date', '3': 4, '4': 1, '5': 3, '10': 'registerDate'},
  ],
};

/// Descriptor for `Ingredient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingredientDescriptor = $convert.base64Decode(
    'CgpJbmdyZWRpZW50EhIKBG5hbWUYASABKAlSBG5hbWUSFgoGYW1vdW50GAIgASgBUgZhbW91bn'
    'QSIwoEdW5pdBgDIAEoDjIPLkluZ3JlZGllbnRVbml0UgR1bml0EiMKDXJlZ2lzdGVyX2RhdGUY'
    'BCABKANSDHJlZ2lzdGVyRGF0ZQ==');

