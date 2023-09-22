abstract class BaseApiService {
  Future<dynamic> getApiCall({required String url});
  Future<dynamic> postApiCall({required String url, required dynamic data});
}
