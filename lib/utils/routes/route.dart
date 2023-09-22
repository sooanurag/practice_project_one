
import 'package:flutter/material.dart';
import 'package:pre_demo_project/utils/routes/route_name.dart';
import 'package:pre_demo_project/view/auth/auth_route.dart';
import 'package:pre_demo_project/view/home_route.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeRoute());
      case RouteName.auth:
        return MaterialPageRoute(builder: (context) => const AutheRoute());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Invaid Route"),
                  ),
                ));
    }
  }
}
