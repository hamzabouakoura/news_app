import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send request Timeout');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive request Timeout');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return const ServerFailure('Request Canceled , Please try again');

      case DioExceptionType.connectionError:
        return const ServerFailure('Connection Error , Please try again');
      case DioExceptionType.unknown:
        return const ServerFailure('Unexpected Error , Please try again');
      default:
        return const ServerFailure('Unexpected Error , Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic data) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(data['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure('Not Found !');
    } else if (statusCode == 500) {
      return const ServerFailure('Oops something went wrong , try again later');
    } else {
      return const ServerFailure('Oops something went wrong , try again later');
    }
  }
}
