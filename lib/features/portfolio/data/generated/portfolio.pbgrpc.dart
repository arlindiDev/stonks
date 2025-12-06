// This is a generated file - do not edit.
//
// Generated from portfolio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'portfolio.pb.dart' as $0;

export 'portfolio.pb.dart';

/// Portfolio Service Definition
@$pb.GrpcServiceName('portfolio.PortfolioService')
class PortfolioServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PortfolioServiceClient(super.channel, {super.options, super.interceptors});

  /// - Chart with ALL periods (1D, 1W, 1M, 6M, YTD, 1Y, ALL)
  /// - All portfolio items
  $grpc.ResponseFuture<$0.GetPortfolioResponse> getPortfolio(
    $0.GetPortfolioRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPortfolio, request, options: options);
  }

  // method descriptors

  static final _$getPortfolio =
      $grpc.ClientMethod<$0.GetPortfolioRequest, $0.GetPortfolioResponse>(
          '/portfolio.PortfolioService/GetPortfolio',
          ($0.GetPortfolioRequest value) => value.writeToBuffer(),
          $0.GetPortfolioResponse.fromBuffer);
}

@$pb.GrpcServiceName('portfolio.PortfolioService')
abstract class PortfolioServiceBase extends $grpc.Service {
  $core.String get $name => 'portfolio.PortfolioService';

  PortfolioServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetPortfolioRequest, $0.GetPortfolioResponse>(
            'GetPortfolio',
            getPortfolio_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetPortfolioRequest.fromBuffer(value),
            ($0.GetPortfolioResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPortfolioResponse> getPortfolio_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetPortfolioRequest> $request) async {
    return getPortfolio($call, await $request);
  }

  $async.Future<$0.GetPortfolioResponse> getPortfolio(
      $grpc.ServiceCall call, $0.GetPortfolioRequest request);
}
