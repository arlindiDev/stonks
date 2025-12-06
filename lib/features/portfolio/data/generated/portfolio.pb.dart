// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetPortfolioRequest extends $pb.GeneratedMessage {
  factory GetPortfolioRequest({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  GetPortfolioRequest._();

  factory GetPortfolioRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPortfolioRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioRequest copyWith(void Function(GetPortfolioRequest) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioRequest))
          as GetPortfolioRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest create() => GetPortfolioRequest._();
  @$core.override
  GetPortfolioRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioRequest>(create);
  static GetPortfolioRequest? _defaultInstance;

  /// Optional filters can be added here
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetPortfolioResponse extends $pb.GeneratedMessage {
  factory GetPortfolioResponse({
    PortfolioChart? chart,
    $core.Iterable<PortfolioItem>? items,
  }) {
    final result = create();
    if (chart != null) result.chart = chart;
    if (items != null) result.items.addAll(items);
    return result;
  }

  GetPortfolioResponse._();

  factory GetPortfolioResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPortfolioResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..aOM<PortfolioChart>(1, _omitFieldNames ? '' : 'chart',
        subBuilder: PortfolioChart.create)
    ..pPM<PortfolioItem>(2, _omitFieldNames ? '' : 'items',
        subBuilder: PortfolioItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioResponse copyWith(void Function(GetPortfolioResponse) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioResponse))
          as GetPortfolioResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse create() => GetPortfolioResponse._();
  @$core.override
  GetPortfolioResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioResponse>(create);
  static GetPortfolioResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PortfolioChart get chart => $_getN(0);
  @$pb.TagNumber(1)
  set chart(PortfolioChart value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChart() => $_has(0);
  @$pb.TagNumber(1)
  void clearChart() => $_clearField(1);
  @$pb.TagNumber(1)
  PortfolioChart ensureChart() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<PortfolioItem> get items => $_getList(1);
}

class PortfolioChart extends $pb.GeneratedMessage {
  factory PortfolioChart({
    $core.Iterable<$core.MapEntry<$core.String, ChartPeriodData>>? periods,
  }) {
    final result = create();
    if (periods != null) result.periods.addEntries(periods);
    return result;
  }

  PortfolioChart._();

  factory PortfolioChart.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PortfolioChart.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PortfolioChart',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..m<$core.String, ChartPeriodData>(1, _omitFieldNames ? '' : 'periods',
        entryClassName: 'PortfolioChart.PeriodsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: ChartPeriodData.create,
        valueDefaultOrMaker: ChartPeriodData.getDefault,
        packageName: const $pb.PackageName('portfolio'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioChart clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioChart copyWith(void Function(PortfolioChart) updates) =>
      super.copyWith((message) => updates(message as PortfolioChart))
          as PortfolioChart;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioChart create() => PortfolioChart._();
  @$core.override
  PortfolioChart createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PortfolioChart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PortfolioChart>(create);
  static PortfolioChart? _defaultInstance;

  /// Map of period name to chart data (e.g., "1D", "1W", "1M", "6M", "YTD", "1Y", "ALL")
  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, ChartPeriodData> get periods => $_getMap(0);
}

class ChartPeriodData extends $pb.GeneratedMessage {
  factory ChartPeriodData({
    $core.Iterable<ChartDataPoint>? dataPoints,
    $core.double? latestPrice,
    $core.double? unrealizedPl,
    $core.double? unrealizedPlPercent,
  }) {
    final result = create();
    if (dataPoints != null) result.dataPoints.addAll(dataPoints);
    if (latestPrice != null) result.latestPrice = latestPrice;
    if (unrealizedPl != null) result.unrealizedPl = unrealizedPl;
    if (unrealizedPlPercent != null)
      result.unrealizedPlPercent = unrealizedPlPercent;
    return result;
  }

  ChartPeriodData._();

  factory ChartPeriodData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChartPeriodData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChartPeriodData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..pPM<ChartDataPoint>(1, _omitFieldNames ? '' : 'dataPoints',
        subBuilder: ChartDataPoint.create)
    ..aD(2, _omitFieldNames ? '' : 'latestPrice')
    ..aD(3, _omitFieldNames ? '' : 'unrealizedPl')
    ..aD(4, _omitFieldNames ? '' : 'unrealizedPlPercent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChartPeriodData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChartPeriodData copyWith(void Function(ChartPeriodData) updates) =>
      super.copyWith((message) => updates(message as ChartPeriodData))
          as ChartPeriodData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChartPeriodData create() => ChartPeriodData._();
  @$core.override
  ChartPeriodData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChartPeriodData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChartPeriodData>(create);
  static ChartPeriodData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChartDataPoint> get dataPoints => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get latestPrice => $_getN(1);
  @$pb.TagNumber(2)
  set latestPrice($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLatestPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatestPrice() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get unrealizedPl => $_getN(2);
  @$pb.TagNumber(3)
  set unrealizedPl($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnrealizedPl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnrealizedPl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get unrealizedPlPercent => $_getN(3);
  @$pb.TagNumber(4)
  set unrealizedPlPercent($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnrealizedPlPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnrealizedPlPercent() => $_clearField(4);
}

class ChartDataPoint extends $pb.GeneratedMessage {
  factory ChartDataPoint({
    $core.double? value,
    $fixnum.Int64? timestampMillis,
    $core.double? percentChange,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (timestampMillis != null) result.timestampMillis = timestampMillis;
    if (percentChange != null) result.percentChange = percentChange;
    return result;
  }

  ChartDataPoint._();

  factory ChartDataPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChartDataPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChartDataPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'value')
    ..aInt64(2, _omitFieldNames ? '' : 'timestampMillis')
    ..aD(3, _omitFieldNames ? '' : 'percentChange')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChartDataPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChartDataPoint copyWith(void Function(ChartDataPoint) updates) =>
      super.copyWith((message) => updates(message as ChartDataPoint))
          as ChartDataPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChartDataPoint create() => ChartDataPoint._();
  @$core.override
  ChartDataPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChartDataPoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChartDataPoint>(create);
  static ChartDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestampMillis => $_getI64(1);
  @$pb.TagNumber(2)
  set timestampMillis($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestampMillis() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestampMillis() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get percentChange => $_getN(2);
  @$pb.TagNumber(3)
  set percentChange($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPercentChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentChange() => $_clearField(3);
}

class PortfolioItem extends $pb.GeneratedMessage {
  factory PortfolioItem({
    $core.String? ticker,
    $core.double? position,
    $core.double? avgPrice,
    $core.double? currentPrice,
    $core.double? marketValue,
    $core.double? portfolioPercent,
    $core.double? unrealizedPl,
    $core.double? unrealizedPlPercent,
  }) {
    final result = create();
    if (ticker != null) result.ticker = ticker;
    if (position != null) result.position = position;
    if (avgPrice != null) result.avgPrice = avgPrice;
    if (currentPrice != null) result.currentPrice = currentPrice;
    if (marketValue != null) result.marketValue = marketValue;
    if (portfolioPercent != null) result.portfolioPercent = portfolioPercent;
    if (unrealizedPl != null) result.unrealizedPl = unrealizedPl;
    if (unrealizedPlPercent != null)
      result.unrealizedPlPercent = unrealizedPlPercent;
    return result;
  }

  PortfolioItem._();

  factory PortfolioItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PortfolioItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PortfolioItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ticker')
    ..aD(2, _omitFieldNames ? '' : 'position')
    ..aD(3, _omitFieldNames ? '' : 'avgPrice')
    ..aD(4, _omitFieldNames ? '' : 'currentPrice')
    ..aD(5, _omitFieldNames ? '' : 'marketValue')
    ..aD(6, _omitFieldNames ? '' : 'portfolioPercent')
    ..aD(7, _omitFieldNames ? '' : 'unrealizedPl')
    ..aD(8, _omitFieldNames ? '' : 'unrealizedPlPercent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioItem copyWith(void Function(PortfolioItem) updates) =>
      super.copyWith((message) => updates(message as PortfolioItem))
          as PortfolioItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioItem create() => PortfolioItem._();
  @$core.override
  PortfolioItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PortfolioItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PortfolioItem>(create);
  static PortfolioItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ticker => $_getSZ(0);
  @$pb.TagNumber(1)
  set ticker($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTicker() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicker() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get position => $_getN(1);
  @$pb.TagNumber(2)
  set position($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get avgPrice => $_getN(2);
  @$pb.TagNumber(3)
  set avgPrice($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvgPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvgPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get currentPrice => $_getN(3);
  @$pb.TagNumber(4)
  set currentPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get marketValue => $_getN(4);
  @$pb.TagNumber(5)
  set marketValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMarketValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearMarketValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get portfolioPercent => $_getN(5);
  @$pb.TagNumber(6)
  set portfolioPercent($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPortfolioPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearPortfolioPercent() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get unrealizedPl => $_getN(6);
  @$pb.TagNumber(7)
  set unrealizedPl($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUnrealizedPl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnrealizedPl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get unrealizedPlPercent => $_getN(7);
  @$pb.TagNumber(8)
  set unrealizedPlPercent($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUnrealizedPlPercent() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnrealizedPlPercent() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
