import 'package:grpc/grpc.dart';
import '../../../../core/error/failure.dart';
import '../../data/datasource/portfolio_remote_datasource.dart';
import '../../data/mappers/portfolio_mapper.dart';
import 'portfolio_repository.dart';
import 'portfolio_result.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioRemoteDataSource _remoteDataSource;

  PortfolioRepositoryImpl(this._remoteDataSource);

  @override
  Future<PortfolioResult> getPortfolioData() async {
    try {
      final response = await _remoteDataSource.getPortfolio();
      final portfolioData = PortfolioMapper.fromProtoResponse(response);
      
      return PortfolioResult.success(portfolioData);
    } on GrpcError catch (e) {
      return PortfolioResult.failure(
        NetworkFailure(
          message: _mapGrpcErrorToMessage(e),
          code: e.code.toString(),
          originalError: e,
        ),
      );
    } on FormatException catch (e) {
      return PortfolioResult.failure(
        DataParsingFailure(
          message: 'Failed to parse portfolio data: ${e.message}',
          originalError: e,
        ),
      );
    } catch (e) {
      return PortfolioResult.failure(
        UnexpectedFailure(
          message: 'Failed to load portfolio: ${e.toString()}',
          originalError: e,
        ),
      );
    }
  }

  String _mapGrpcErrorToMessage(GrpcError error) {
    switch (error.code) {
      case StatusCode.unavailable:
        return 'Server is unavailable. Please check your connection.';
      case StatusCode.deadlineExceeded:
        return 'Request timed out. Please try again.';
      case StatusCode.unauthenticated:
        return 'Authentication failed. Please log in again.';
      case StatusCode.permissionDenied:
        return 'Permission denied. You don\'t have access to this resource.';
      case StatusCode.notFound:
        return 'Resource not found.';
      case StatusCode.invalidArgument:
        return 'Invalid request. Please check your input.';
      default:
        return 'Network error: ${error.message ?? 'Unknown error'}';
    }
  }
}
