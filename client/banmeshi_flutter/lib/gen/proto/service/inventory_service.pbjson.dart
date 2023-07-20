//
//  Generated code. Do not modify.
//  source: service/inventory_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use inventoryDescriptor instead')
const Inventory$json = {
  '1': 'Inventory',
  '2': [
    {'1': 'ingredients', '3': 1, '4': 3, '5': 11, '6': '.Ingredient', '10': 'ingredients'},
  ],
};

/// Descriptor for `Inventory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryDescriptor = $convert.base64Decode(
    'CglJbnZlbnRvcnkSLQoLaW5ncmVkaWVudHMYASADKAsyCy5JbmdyZWRpZW50UgtpbmdyZWRpZW'
    '50cw==');

@$core.Deprecated('Use itemDescriptor instead')
const Item$json = {
  '1': 'Item',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
    {'1': 'ingredient', '3': 2, '4': 1, '5': 11, '6': '.Ingredient', '10': 'ingredient'},
  ],
};

/// Descriptor for `Item`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemDescriptor = $convert.base64Decode(
    'CgRJdGVtEhkKBHVzZXIYASABKAsyBS5Vc2VyUgR1c2VyEisKCmluZ3JlZGllbnQYAiABKAsyCy'
    '5JbmdyZWRpZW50UgppbmdyZWRpZW50');

