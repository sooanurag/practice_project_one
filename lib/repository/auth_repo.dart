import 'package:pre_demo_project/data/network/base_api_service.dart';
import 'package:pre_demo_project/data/network/network_api_service.dart';

import '../resources/app_urls.dart';

class AuthRespository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> signUpApi(dynamic data) async {
    dynamic jsonResponse;
    try {
      dynamic response = await _apiService.postApiCall(
        url: AppUrl.signup,
        data: data,
        header: <String,String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      jsonResponse = response;
    } catch (e) {
      rethrow;
    }
    return jsonResponse;
  }
}
