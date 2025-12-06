//
//  Generated code. Do not modify.
//  source: portfolio.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetPortfolioRequest extends $pb.GeneratedMessage {
  factory GetPortfolioRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetPortfolioRequest._() : super();
  factory GetPortfolioRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPortfolioRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPortfolioRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPortfolioRequest clone() => GetPortfolioRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPortfolioRequest copyWith(void Function(GetPortfolioRequest) updates) => super.copyWith((message) => updates(message as GetPortfolioRequest)) as GetPortfolioRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest create() => GetPortfolioRequest._();
  GetPortfolioRequest createEmptyInstance() => create();
  static $pb.PbList<GetPortfolioRequest> createRepeated() => $pb.PbList<GetPortfolioRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPortfolioRequest>(create);
  static GetPortfolioRequest? _defaultInstance;

  /// Optional filters can be added here
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetPortfolioResponse extends $pb.GeneratedMessage {
  factory GetPortfolioResponse({
    PortfolioChart? chart,
    $core.Iterable<PortfolioItem>? items,
  }) {
    final $result = create();
    if (chart != null) {
      $result.chart = chart;
    }
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  GetPortfolioResponse._() : super();
  factory GetPortfolioResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPortfolioResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPortfolioResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'), createEmptyInstance: create)
    ..aOM<PortfolioChart>(1, _omitFieldNames ? '' : 'chart', subBuilder: PortfolioChart.create)
    ..pc<PortfolioItem>(2, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PortfolioItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPortfolioResponse clone() => GetPortfolioResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPortfolioResponse copyWith(void Function(GetPortfolioResponse) updates) => super.copyWith((message) => updates(message as GetPortfolioResponse)) as GetPortfolioResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse create() => GetPortfolioResponse._();
  GetPortfolioResponse createEmptyInstance() => create();
  static $pb.PbList<GetPortfolioResponse> createRepeated() => $pb.PbList<GetPortfolioResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPortfolioResponse>(create);
  static GetPortfolioResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PortfolioChart get chart => $_getN(0);
  @$pb.TagNumber(1)
  set chart(PortfolioChart v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChart() => $_has(0);
  @$pb.TagNumber(1)
  void clearChart() => clearField(1);
  @$pb.TagNumber(1)
  PortfolioChart ensureChart() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PortfolioItem> get items => $_getList(1);
}

class PortfolioChart extends $pb.GeneratedMessage {
  factory PortfolioChart({
    $core.Map<$core.String, ChartPeriodData>? periods,
  }) {
    final $result = create();
    if (periods != null) {
      $result.periods.addAll(periods);
    }
    return $result;
  }
  PortfolioChart._() : super();
  factory PortfolioChart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PortfolioChart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PortfolioChart', package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'), createEmptyInstance: create)
    ..m<$core.String, ChartPeriodData>(1, _omitFieldNames ? '' : 'periods', entryClassName: 'PortfolioChart.PeriodsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: ChartPeriodData.create, valueDefaultOrMaker: ChartPeriodData.getDefault, packageName: const $pb.PackageName('portfolio'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PortfolioChart clone() => PortfolioChart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PortfolioChart copyWith(void Function(PortfolioChart) updates) => super.copyWith((message) => updates(message as PortfolioChart)) as PortfolioChart;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioChart create() => PortfolioChart._();
  PortfolioChart createEmptyInstance() => create();
  static $pb.PbList<PortfolioChart> createRepeated() => $pb.PbList<PortfolioChart>();
  @$core.pragma('dart2js:noInline')
  static PortfolioChart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PortfolioChart>(create);
  static PortfolioChart? _defaultInstance;

  /// Map of period name to chart data (e.g., "1D", "1W", "1M", "6M", "YTD", "1Y", "ALL")
  @$pb.TagNumber(1)
  $core.Map<$core.String, ChartPeriodData> get periods => $_getMap(0);
}

class ChartPeriodData extends $pb.GeneratedMessage {
  factory ChartPeriodData({
    $core.Iterable<ChartDataPoint>? dataPoints,
    $core.double? latestPrice,
    $core.double? unrealizedPl,
    $core.double? unrealizedPlPercent,
  }) {
    final $result = create();
    if (dataPoints != null) {
      $result.dataPoints.addAll(dataPoints);
    }
    if (latestPrice != null) {
      $result.latestPrice = latestPrice;
    }
    if (unrealizedPl != null) {
      $result.unrealizedPl = unrealizedPl;
    }
    if (unrealizedPlPercent != null) {
      $result.unrealizedPlPercent = unrealizedPlPercent;
    }
    return $result;
  }
  ChartPeriodData._() : super();
  factory ChartPeriodData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChartPeriodData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChartPeriodData', package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'), createEmptyInstance: create)
    ..pc<ChartDataPoint>(1, _omitFieldNames ? '' : 'dataPoints', $pb.PbFieldType.PM, subBuilder: ChartDataPoint.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'latestPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'unrealizedPl', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'unrealizedPlPercent', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChartPeriodData clone() => ChartPeriodData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChartPeriodData copyWith(void Function(ChartPeriodData) updates) => super.copyWith((message) => updates(message as ChartPeriodData)) as ChartPeriodData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChartPeriodData create() => ChartPeriodData._();
  ChartPeriodData createEmptyInstance() => create();
  static $pb.PbList<ChartPeriodData> createRepeated() => $pb.PbList<ChartPeriodData>();
  @$core.pragma('dart2js:noInline')
  static ChartPeriodData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChartPeriodData>(create);
  static ChartPeriodData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChartDataPoint> get dataPoints => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get latestPrice => $_getN(1);
  @$pb.TagNumber(2)
  set latestPrice($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatestPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatestPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get unrealizedPl => $_getN(2);
  @$pb.TagNumber(3)
  set unrealizedPl($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnrealizedPl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnrealizedPl() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get unrealizedPlPercent => $_getN(3);
  @$pb.TagNumber(4)
  set unrealizedPlPercent($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUnrealizedPlPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnrealizedPlPercent() => clearField(4);
}

class ChartDataPoint extends $pb.GeneratedMessage {
  factory ChartDataPoint({
    $core.double? value,
    $fixnum.Int64? timestampMillis,
    $core.double? percentChange,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (timestampMillis != null) {
      $result.timestampMillis = timestampMillis;
    }
    if (percentChange != null) {
      $result.percentChange = percentChange;
    }
    return $result;
  }
  ChartDataPoint._() : super();
  factory ChartDataPoint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChartDataPoint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChartDataPoint', package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OD)
    ..aInt64(2, _omitFieldNames ? '' : 'timestampMillis')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'percentChange', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChartDataPoint clone() => ChartDataPoint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChartDataPoint copyWith(void Function(ChartDataPoint) updates) => super.copyWith((message) => updates(message as ChartDataPoint)) as ChartDataPoint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChartDataPoint create() => ChartDataPoint._();
  ChartDataPoint createEmptyInstance() => create();
  static $pb.PbList<ChartDataPoint> createRepeated() => $pb.PbList<ChartDataPoint>();
  @$core.pragma('dart2js:noInline')
  static ChartDataPoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChartDataPoint>(create);
  static ChartDataPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestampMillis => $_getI64(1);
  @$pb.TagNumber(2)
  set timestampMillis($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestampMillis() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestampMillis() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get percentChange => $_getN(2);
  @$pb.TagNumber(3)
  set percentChange($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPercentChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentChange() => clearField(3);
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
    final $result = create();
    if (ticker != null) {
      $result.ticker = ticker;
    }
    if (position != null) {
      $result.position = position;
    }
    if (avgPrice != null) {
      $result.avgPrice = avgPrice;
    }
    if (currentPrice != null) {
      $result.currentPrice = currentPrice;
    }
    if (marketValue != null) {
      $result.marketValue = marketValue;
    }
    if (portfolioPercent != null) {
      $result.portfolioPercent = portfolioPercent;
    }
    if (unrealizedPl != null) {
      $result.unrealizedPl = unrealizedPl;
    }
    if (unrealizedPlPercent != null) {
      $result.unrealizedPlPercent = unrealizedPlPercent;
    }
    return $result;
  }
  PortfolioItem._() : super();
  factory PortfolioItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PortfolioItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PortfolioItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'portfolio'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ticker')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'position', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'avgPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'currentPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'marketValue', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'portfolioPercent', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'unrealizedPl', $pb.PbFieldType.OD)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'unrealizedPlPercent', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PortfolioItem clone() => PortfolioItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PortfolioItem copyWith(void Function(PortfolioItem) updates) => super.copyWith((message) => updates(message as PortfolioItem)) as PortfolioItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioItem create() => PortfolioItem._();
  PortfolioItem createEmptyInstance() => create();
  static $pb.PbList<PortfolioItem> createRepeated() => $pb.PbList<PortfolioItem>();
  @$core.pragma('dart2js:noInline')
  static PortfolioItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PortfolioItem>(create);
  static PortfolioItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ticker => $_getSZ(0);
  @$pb.TagNumber(1)
  set ticker($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTicker() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicker() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get position => $_getN(1);
  @$pb.TagNumber(2)
  set position($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get avgPrice => $_getN(2);
  @$pb.TagNumber(3)
  set avgPrice($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvgPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvgPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get currentPrice => $_getN(3);
  @$pb.TagNumber(4)
  set currentPrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get marketValue => $_getN(4);
  @$pb.TagNumber(5)
  set marketValue($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMarketValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearMarketValue() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get portfolioPercent => $_getN(5);
  @$pb.TagNumber(6)
  set portfolioPercent($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPortfolioPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearPortfolioPercent() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get unrealizedPl => $_getN(6);
  @$pb.TagNumber(7)
  set unrealizedPl($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUnrealizedPl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnrealizedPl() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get unrealizedPlPercent => $_getN(7);
  @$pb.TagNumber(8)
  set unrealizedPlPercent($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUnrealizedPlPercent() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnrealizedPlPercent() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
