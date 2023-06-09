import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/loginPageProvider.dart';

// Text Field for Email.....................................
Widget textFieldEmail(appTranslations) {
  return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<LoginPageProvider>(
        builder: (context, providerValue, child) {
          return TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputTextDecoration(Intl.message(appTranslations['email'])),
              onChanged: (value) {
                providerValue.emailNotifier(value);
              },
              validator: (value) {
                const pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
                if (value!.trimLeft().length < 3) {
                  if (RegExp(r'[\s]').hasMatch(value)) {
                    return "Email must not contain spaces";
                  }
                  return Intl.message(appTranslations['invalid_email_msg']);
                } else if (!RegExp(pattern).hasMatch(value)) {
                  return Intl.message(appTranslations['invalid_email_msg']);
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: textStyleLabel());

        },
      ));
}

// Text Field for password.....................................
Widget textFieldPassword(appTranslations) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Consumer<LoginPageProvider>(
      builder: (context, providerValue, child) {
        return TextFormField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          style: textStyleLabel(),
          decoration: inputTextDecoration(Intl.message(appTranslations['password'])),
          onChanged: (value) {
            providerValue.passwordNotifier(value);
          },
        );
      },
    ),
  );
}

// Input Decoration for above TextFormFields.....................
InputDecoration inputTextDecoration(String value) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(20),
    labelText: value,
    labelStyle: textStyleLabel(),
    focusColor: Colors.white,
    focusedBorder: textFieldBorder(),
    enabledBorder: textFieldBorder(),
    errorBorder: textFieldBorder(),
    focusedErrorBorder: textFieldBorder(),
    errorStyle: TextStyle(fontSize: 14),
    border: textFieldBorder(),
  );
}

// Border for above TextFormFields...............................
OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
      gapPadding: 5);
}

// Text Styling for above TextFormFields.........................
TextStyle textStyleLabel() {
  return const TextStyle(color: Colors.white);
}
