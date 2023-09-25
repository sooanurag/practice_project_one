import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/enums.dart';

class Utils {
  authRouteFormContainer({
    required GlobalKey<FormState> formKey,
    required Widget formWidget,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      color: Colors.white,
      child: Form(
        key: formKey,
        child: formWidget,
      ),
    );
  }

  authRouteListTile({
    required ValueNotifier<AuthRouteRadio> authRouteRadio,
    required String tileTitle,
    required AuthRouteRadio radioValue
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        title:  Text(
          tileTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        tileColor: (authRouteRadio.value == radioValue)
            ? AppColors.backgroundColor
            : AppColors.greyBackgroundCOlor,
        leading: Radio(
            activeColor: AppColors.secondaryColor,
            value: radioValue,
            groupValue: authRouteRadio.value,
            onChanged: (AuthRouteRadio? value) {
              authRouteRadio.value = value!;
            }),
      ),
    );
  }

  static void flushBarErrorMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        flushbarPosition: FlushbarPosition.BOTTOM,
        isDismissible: true,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        icon: const Icon(Icons.error),
        message: message,
        title: "Message:",
      )..show(context),
    );
  }
}
