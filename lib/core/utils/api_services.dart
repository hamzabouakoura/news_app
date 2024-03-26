import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this._dio);
  final Dio _dio;
  final String apiKey = '54abf2813f7b4660b61dd12911495870';
  final String _baseUrl = 'https://newsapi.org/v2/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint&apiKey=$apiKey');
    return response.data;
  }
}
