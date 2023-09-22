import 'dart:convert';
import 'dart:io';

import 'package:pre_demo_project/data/app_exceptions.dart';
import 'package:pre_demo_project/data/network/base_api_service.dart';
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiCall({required String url}) async {
    dynamic apiResponse;
    try {
      final respsonse =
          await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      apiResponse = respsonse;
    } on SocketException {
      throw FetchDataException("No internet");
    }

    return returnResponse(apiResponse);
  }

  @override
  Future postApiCall({required String url, required data}) async {
    dynamic apiResponse;
    try {
      final response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      apiResponse = response;
    } on SocketException {
      throw FetchDataException("No Internet");
    }

    return returnResponse(apiResponse);
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 404:
        throw UnauthorizedException(response.body);
      default:
        throw FetchDataException(response.body);
    }
  }
}
