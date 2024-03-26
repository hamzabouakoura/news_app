import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this._dio);
  final Dio _dio;
  final String _apiKey = API_KEY;
  final String _baseUrl = 'https://newsapi.org/v2/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint&_apiKey=$_apiKey');
    return response.data;
  }
}
