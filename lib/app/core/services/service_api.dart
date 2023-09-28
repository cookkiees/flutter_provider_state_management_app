import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../helpers/my_app_logger.dart';
import 'service_api_result.dart';
import 'service_api_result_type.dart';
import 'service_api_request.dart';

class ApiService {
  static final ApiService _instance = ApiService._privateConstructor();
  ApiService._privateConstructor();
  static ApiService get instance {
    return _instance;
  }

  Future<ApiResult<T>> request<T>(ApiRequest<T> request,
      {bool articleApi = false}) async {
    final uri = _buildUrl(request.path, request.params, articleApi: articleApi);
    final headers = request.headers;
    http.Response response;

    try {
      switch (request.method) {
        case 'GET':
          response = await http.get(uri, headers: headers);
          break;
        case 'POST':
          response =
              await http.post(uri, body: request.params, headers: headers);
          break;
        case 'PUT':
          response =
              await http.put(uri, body: request.params, headers: headers);
          break;
        case 'DELETE':
          response = await http.delete(uri, headers: headers);
          break;
        default:
          response = await http.get(uri, headers: headers);
      }
      debugPrint(request, headers, response);
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        var data = request.decoder(decodedJson);

        // Check if the data is null or empty
        if (data == null || (data is List && data.isEmpty)) {
          // You can handle this as a failure or a special case as needed
          return ApiResult<T>(
            result: ApiResultType.failure,
            message: "Data is empty or null",
          );
        } else {
          return ApiResult<T>(
            result: ApiResultType.success,
            message: "Successful",
            data: data,
          );
        }
      } else {
        return ApiResult(
          result: ApiResultType.failure,
          message: 'Failure',
        );
      }
    } catch (e) {
      return ApiResult(
        result: ApiResultType.failure,
        message: 'Failure: $e',
      );
    }
  }

  Uri _buildUrl(String path, Map<String, dynamic>? params,
      {bool articleApi = false}) {
    if (articleApi == true) {
      final url = Uri.parse(articleAPIBaseURL + articleaAPIVersion + path);
      if (params != null && params.isNotEmpty) {
        return url.replace(queryParameters: params);
      }
      return url;
    } else {
      final url = Uri.parse(apiBaseURL + path);
      if (params != null && params.isNotEmpty) {
        return url.replace(queryParameters: params);
      }
      return url;
    }
  }

  Future<void> debugPrint(
      ApiRequest request, headers, http.Response response) async {
    MyAppLogger.logDebug('--------------- REQUEST & RESPONSE ---------------');
    MyAppLogger.logDebug('Method: ${request.method}');
    MyAppLogger.logDebug('Path: ${response.request?.url.toString()}');
    MyAppLogger.logDebug('Headers: $headers');
    MyAppLogger.logDebug('Parameters: ${request.params}');
    MyAppLogger.logDebug('Status: ${response.statusCode}');
    MyAppLogger.logDebug('Headers: ${response.headers}');
    MyAppLogger.logDebug('Response Body: ${response.body}');
    MyAppLogger.logDebug('--------------------------------------------------');
  }
}
