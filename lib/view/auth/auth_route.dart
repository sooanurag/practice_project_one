import 'package:flutter/material.dart';
import 'package:pre_demo_project/resources/colors.dart';
import 'package:pre_demo_project/resources/components/custom_buttons.dart';
import 'package:pre_demo_project/resources/components/custom_textfield.dart';
import 'package:pre_demo_project/resources/enums.dart';
import 'package:pre_demo_project/resources/image_path.dart';
import 'package:pre_demo_project/utils/utils.dart';
import 'package:pre_demo_project/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class AutheRoute extends StatefulWidget {
  const AutheRoute({super.key});

  @override
  State<AutheRoute> createState() => _AutheRouteState();
}

class _AutheRouteState extends State<AutheRoute> {
  // AuthRouteRadio _auth = AuthRouteRadio.signIn;
  final ValueNotifier<AuthRouteRadio> _authRouteRadio =
      ValueNotifier<AuthRouteRadio>(AuthRouteRadio.signIn);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _createAccountFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  @override
  void deactivate() {
    super.deactivate();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("buildCall");
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Welcome",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          ValueListenableBuilder(
              valueListenable: _authRouteRadio,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Utils().authRouteListTile(
                      authRouteRadio: _authRouteRadio,
                      tileTitle: "Create Account",
                      radioValue: AuthRouteRadio.signUp,
                    ),
                    if (_authRouteRadio.value == AuthRouteRadio.signUp)
                      Utils().authRouteFormContainer(
                        formKey: _createAccountFormKey,
                        formWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextField().customTextFormField(
                                inputController: nameController,
                                hintText: "Full-Name",
                              ),
                              const Divider(),
                              CustomTextField().customTextFormField(
                                inputController: emailController,
                                hintText: "Email id",
                              ),
                              const Divider(),
                              CustomTextField().customTextFormField(
                                inputController: passwordController,
                                hintText: "Password",
                              ),
                              const Divider(),
                              CustomButton().customElevatedButton(
                                title: "Sign Up",
                                onPressed: () {
                                  debugPrint("onpress");
                                  if (_createAccountFormKey.currentState!
                                      .validate()) {
                                    debugPrint("inValid");
                                    final Map<String,String> data = {
                                      "name": nameController.text,
                                      "email": emailController.text,
                                      "password": passwordController.text,
                                    };
                                    AuthProvider().callSignUpApi(
                                      context,
                                      data,
                                    );
                                  } else {
                                    Utils.flushBarErrorMessage(
                                        context, "Fill form correctly!");
                                  }
                                },
                              ),
                            ]),
                      ),
                    Utils().authRouteListTile(
                      authRouteRadio: _authRouteRadio,
                      tileTitle: "Sign In",
                      radioValue: AuthRouteRadio.signIn,
                    ),
                    if (_authRouteRadio.value == AuthRouteRadio.signIn)
                      Utils().authRouteFormContainer(
                          formKey: _signInFormKey, formWidget: Column()),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
