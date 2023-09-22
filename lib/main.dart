import 'package:flutter/material.dart';
import 'package:pre_demo_project/resources/colors.dart';
import 'package:pre_demo_project/utils/routes/route_name.dart';
import 'package:pre_demo_project/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import 'utils/routes/route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: AppColors.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      initialRoute: RouteName.auth,
      onGenerateRoute: Routes.generateRoute,
    ),
    ),
  );
}
