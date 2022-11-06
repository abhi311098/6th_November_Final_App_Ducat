import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../utils/const text/const_text.dart';
import '../api_status.dart';

class ProductService {

  static Future<Object?> getProduct({String? apiUrl}) async {
    try {
      var url = Uri.parse(apiUrl!);
      var response = await http.get(url).timeout(Duration(seconds: timeoutTime));
      if (response.statusCode == successResponse) {
        return Success(response: response.body);
      }
    } on HttpException {
      return Failure(code: httpException, errorResponse: httpExceptionMsg);
    } on SocketException {
      return Failure(code: noInternet, errorResponse: noInternetMsg);
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: invalidFormatMsg);
    } on TimeoutException {
      return Failure(code: timeout, errorResponse: timeoutMsg);
    } catch (e) {
      return Failure(code: unknownError, errorResponse: e);
    }
  }
}
