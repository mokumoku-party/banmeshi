//
//  Generated code. Do not modify.
//  source: service/recipe_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use recommendFoodDescriptor instead')
const RecommendFood$json = {
  '1': 'RecommendFood',
  '2': [
    {'1': 'recommend_foods', '3': 1, '4': 3, '5': 11, '6': '.Food', '10': 'recommendFoods'},
  ],
};

/// Descriptor for `RecommendFood`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recommendFoodDescriptor = $convert.base64Decode(
    'Cg1SZWNvbW1lbmRGb29kEi4KD3JlY29tbWVuZF9mb29kcxgBIAMoCzIFLkZvb2RSDnJlY29tbW'
    'VuZEZvb2Rz');

@$core.Deprecated('Use recipeDescriptor instead')
const Recipe$json = {
  '1': 'Recipe',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
    {'1': 'food', '3': 2, '4': 1, '5': 11, '6': '.Food', '10': 'food'},
  ],
};

/// Descriptor for `Recipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recipeDescriptor = $convert.base64Decode(
    'CgZSZWNpcGUSGQoEdXNlchgBIAEoCzIFLlVzZXJSBHVzZXISGQoEZm9vZBgCIAEoCzIFLkZvb2'
    'RSBGZvb2Q=');

