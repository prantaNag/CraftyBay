import 'dart:convert';
import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/presentation/state_holders/auth_controller.dart';
import 'package:craftybay/presentation/ui/screens/email_verification_screen.dart';
import 'package:get/get.dart' as getx;


import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  late final Logger logger;

  final AuthController authController;

  NetworkCaller( {required this.logger, required this.authController});
  
 

  Future<NetworkResponse> getRequest(
      {required String url, String? token, required bool isSuccess}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, ' ');
      final Response response = await get(uri, headers: {
        'token': '${token ?? AuthController.accessToken}',
      },);

      if (response.statusCode == 200) {
        _responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodeBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode, responseData: decodeBody, isSuccess: true,);
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
             if (response.statusCode == 401) {
          _moveToLogin();
        }
        return NetworkResponse(
         
          statusCode: response.statusCode, isSuccess: false, 
        );
      }
    } catch (e) {
      _responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        
        statusCode: -1,
        errorMessage: e.toString(), isSuccess: false, 
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url,
      required bool isSuccess,
      Map<String, dynamic>? body}) async {
  
    try {
 Uri uri = Uri.parse(url);
      _requestLog(url, {}, body ?? {}, AuthController.accessToken ?? '');
      final Response response = await post(
        uri,
        headers: {
          'token': '${AuthController.accessToken}',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        _responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedBody,
        );
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
        if (response.statusCode == 401) {
          _moveToLogin();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        
        statusCode: -1,
        errorMessage: e.toString(), isSuccess: false, 
      );
    }
  }

  Future<void> _moveToLogin() async {
    await authController.clearUserData();
    getx.Get.to(() => const EmailVerificationScreen());
  }

  void _requestLog( String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String token) {
    logger.i('''
    Url: $url
    Params: $params
    Body: $body,
    Token: $token
    ''');
  }

  void _responseLog(String url, int statusCode, dynamic responseBody,
      Map<String, dynamic> headers, bool isSuccess,
      [dynamic error]) {
    String message = '''
  Url: $url,
  Headers : $headers,
  Body: $responseBody,
  StatusCode: $statusCode,
  Error: $error,
''';

    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
