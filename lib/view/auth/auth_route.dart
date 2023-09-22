import 'package:flutter/material.dart';
import 'package:pre_demo_project/resources/colors.dart';
import 'package:pre_demo_project/resources/components/custom_textfield.dart';
import 'package:pre_demo_project/resources/enums.dart';
import 'package:pre_demo_project/resources/image_path.dart';
import 'package:pre_demo_project/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class AutheRoute extends StatefulWidget {
  const AutheRoute({super.key});

  @override
  State<AutheRoute> createState() => _AutheRouteState();
}

class _AutheRouteState extends State<AutheRoute> {
  // AuthRouteRadio _auth = AuthRouteRadio.signIn;
  final ValueNotifier<AuthRouteRadio> _authRadio =
      ValueNotifier<AuthRouteRadio>(AuthRouteRadio.signIn);
  @override
  Widget build(BuildContext context) {
    debugPrint("buildCall");
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final _nameController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundCOlor,
      appBar: AppBar(
        title: Image.asset(
          ImagePath.amazonLogo,
          width: screenWidth * 0.25,
        ),
        elevation: 1,
        backgroundColor: AppColors.greyBackgroundCOlor,
      ),
      body: Column(
        children: [
          const Text(
            "Welcome",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          ValueListenableBuilder(
              valueListenable: _authRadio,
              builder: (context, value, child) {
                return Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "Create Account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      tileColor: (_authRadio.value == AuthRouteRadio.signIn)
                          ? AppColors.backgroundColor
                          : AppColors.greyBackgroundCOlor,
                      leading: Radio(
                          activeColor: AppColors.secondaryColor,
                          value: AuthRouteRadio.signIn,
                          groupValue: _authRadio.value,
                          onChanged: (AuthRouteRadio? value) {
                            _authRadio.value = value!;
                          }),
                    ),
                    if (_authRadio.value == AuthRouteRadio.signIn)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTestField.customTextFormField(
                                  inputController: _nameController,
                                  hintText: "Name")
                            ]),
                      ),
                    ListTile(
                      title: const Text(
                        "Sign-up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          activeColor: AppColors.secondaryColor,
                          value: AuthRouteRadio.signUp,
                          groupValue: _authRadio.value,
                          onChanged: (AuthRouteRadio? value) {
                            _authRadio.value = value!;
                          }),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
