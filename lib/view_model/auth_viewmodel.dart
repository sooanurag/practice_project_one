import 'package:flutter/material.dart';
import 'package:pre_demo_project/repository/auth_repo.dart';

class AuthProvider with ChangeNotifier {
  final _myrepo = AuthRespository();

  static bool _loading = false;
  static bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> callSignUpApi(BuildContext context, dynamic data) async {
    setLoading(true);
    await _myrepo.signUpApi(data).then((value) {
      debugPrint(value.toString());
    }).onError((error, stackTrace) {
      debugPrint('error/$error');
    });
  }
}
