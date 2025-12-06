// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getPortfolioRequestDescriptor instead')
const GetPortfolioRequest$json = {
  '1': 'GetPortfolioRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetPortfolioRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPortfolioRequestDescriptor =
    $convert.base64Decode(
        'ChNHZXRQb3J0Zm9saW9SZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use getPortfolioResponseDescriptor instead')
const GetPortfolioResponse$json = {
  '1': 'GetPortfolioResponse',
  '2': [
    {
      '1': 'chart',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.portfolio.PortfolioChart',
      '10': 'chart'
    },
    {
      '1': 'items',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.portfolio.PortfolioItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `GetPortfolioResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPortfolioResponseDescriptor = $convert.base64Decode(
    'ChRHZXRQb3J0Zm9saW9SZXNwb25zZRIvCgVjaGFydBgBIAEoCzIZLnBvcnRmb2xpby5Qb3J0Zm'
    '9saW9DaGFydFIFY2hhcnQSLgoFaXRlbXMYAiADKAsyGC5wb3J0Zm9saW8uUG9ydGZvbGlvSXRl'
    'bVIFaXRlbXM=');

@$core.Deprecated('Use portfolioChartDescriptor instead')
const PortfolioChart$json = {
  '1': 'PortfolioChart',
  '2': [
    {
      '1': 'periods',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.portfolio.PortfolioChart.PeriodsEntry',
      '10': 'periods'
    },
  ],
  '3': [PortfolioChart_PeriodsEntry$json],
};

@$core.Deprecated('Use portfolioChartDescriptor instead')
const PortfolioChart_PeriodsEntry$json = {
  '1': 'PeriodsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.portfolio.ChartPeriodData',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `PortfolioChart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioChartDescriptor = $convert.base64Decode(
    'Cg5Qb3J0Zm9saW9DaGFydBJACgdwZXJpb2RzGAEgAygLMiYucG9ydGZvbGlvLlBvcnRmb2xpb0'
    'NoYXJ0LlBlcmlvZHNFbnRyeVIHcGVyaW9kcxpWCgxQZXJpb2RzRW50cnkSEAoDa2V5GAEgASgJ'
    'UgNrZXkSMAoFdmFsdWUYAiABKAsyGi5wb3J0Zm9saW8uQ2hhcnRQZXJpb2REYXRhUgV2YWx1ZT'
    'oCOAE=');

@$core.Deprecated('Use chartPeriodDataDescriptor instead')
const ChartPeriodData$json = {
  '1': 'ChartPeriodData',
  '2': [
    {
      '1': 'data_points',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.portfolio.ChartDataPoint',
      '10': 'dataPoints'
    },
    {'1': 'latest_price', '3': 2, '4': 1, '5': 1, '10': 'latestPrice'},
    {'1': 'unrealized_pl', '3': 3, '4': 1, '5': 1, '10': 'unrealizedPl'},
    {
      '1': 'unrealized_pl_percent',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'unrealizedPlPercent'
    },
  ],
};

/// Descriptor for `ChartPeriodData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chartPeriodDataDescriptor = $convert.base64Decode(
    'Cg9DaGFydFBlcmlvZERhdGESOgoLZGF0YV9wb2ludHMYASADKAsyGS5wb3J0Zm9saW8uQ2hhcn'
    'REYXRhUG9pbnRSCmRhdGFQb2ludHMSIQoMbGF0ZXN0X3ByaWNlGAIgASgBUgtsYXRlc3RQcmlj'
    'ZRIjCg11bnJlYWxpemVkX3BsGAMgASgBUgx1bnJlYWxpemVkUGwSMgoVdW5yZWFsaXplZF9wbF'
    '9wZXJjZW50GAQgASgBUhN1bnJlYWxpemVkUGxQZXJjZW50');

@$core.Deprecated('Use chartDataPointDescriptor instead')
const ChartDataPoint$json = {
  '1': 'ChartDataPoint',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
    {'1': 'timestamp_millis', '3': 2, '4': 1, '5': 3, '10': 'timestampMillis'},
    {'1': 'percent_change', '3': 3, '4': 1, '5': 1, '10': 'percentChange'},
  ],
};

/// Descriptor for `ChartDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chartDataPointDescriptor = $convert.base64Decode(
    'Cg5DaGFydERhdGFQb2ludBIUCgV2YWx1ZRgBIAEoAVIFdmFsdWUSKQoQdGltZXN0YW1wX21pbG'
    'xpcxgCIAEoA1IPdGltZXN0YW1wTWlsbGlzEiUKDnBlcmNlbnRfY2hhbmdlGAMgASgBUg1wZXJj'
    'ZW50Q2hhbmdl');

@$core.Deprecated('Use portfolioItemDescriptor instead')
const PortfolioItem$json = {
  '1': 'PortfolioItem',
  '2': [
    {'1': 'ticker', '3': 1, '4': 1, '5': 9, '10': 'ticker'},
    {'1': 'position', '3': 2, '4': 1, '5': 1, '10': 'position'},
    {'1': 'avg_price', '3': 3, '4': 1, '5': 1, '10': 'avgPrice'},
    {'1': 'current_price', '3': 4, '4': 1, '5': 1, '10': 'currentPrice'},
    {'1': 'market_value', '3': 5, '4': 1, '5': 1, '10': 'marketValue'},
    {
      '1': 'portfolio_percent',
      '3': 6,
      '4': 1,
      '5': 1,
      '10': 'portfolioPercent'
    },
    {'1': 'unrealized_pl', '3': 7, '4': 1, '5': 1, '10': 'unrealizedPl'},
    {
      '1': 'unrealized_pl_percent',
      '3': 8,
      '4': 1,
      '5': 1,
      '10': 'unrealizedPlPercent'
    },
  ],
};

/// Descriptor for `PortfolioItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioItemDescriptor = $convert.base64Decode(
    'Cg1Qb3J0Zm9saW9JdGVtEhYKBnRpY2tlchgBIAEoCVIGdGlja2VyEhoKCHBvc2l0aW9uGAIgAS'
    'gBUghwb3NpdGlvbhIbCglhdmdfcHJpY2UYAyABKAFSCGF2Z1ByaWNlEiMKDWN1cnJlbnRfcHJp'
    'Y2UYBCABKAFSDGN1cnJlbnRQcmljZRIhCgxtYXJrZXRfdmFsdWUYBSABKAFSC21hcmtldFZhbH'
    'VlEisKEXBvcnRmb2xpb19wZXJjZW50GAYgASgBUhBwb3J0Zm9saW9QZXJjZW50EiMKDXVucmVh'
    'bGl6ZWRfcGwYByABKAFSDHVucmVhbGl6ZWRQbBIyChV1bnJlYWxpemVkX3BsX3BlcmNlbnQYCC'
    'ABKAFSE3VucmVhbGl6ZWRQbFBlcmNlbnQ=');
