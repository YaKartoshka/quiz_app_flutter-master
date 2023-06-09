import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/RegisterPageProvider.dart';

Widget textFieldName(appTranslations) {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: textFieldDecoration(Intl.message(appTranslations['name'])),
          onChanged: (value) {
            providerValue.nameController(value);
          },
        ),
      );
    },
  );
}

Widget textFieldEmail(appTranslations) {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
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
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          decoration: textFieldDecoration(Intl.message(appTranslations['email'])),
          onChanged: (value) {
            providerValue.emailController(value);
          },
        ),
      );
    },
  );
}

Widget textFieldPassword(appTranslations) {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          decoration: textFieldDecoration(Intl.message(appTranslations['password'])),
          onChanged: (value) {
            providerValue.passwordController(value);
          },
        ),
      );
    },
  );
}

InputDecoration textFieldDecoration(String label) {
  return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white),
      errorBorder: textFieldBorder(),
      focusedErrorBorder: textFieldBorder(),
      errorStyle: TextStyle(fontSize: 14),
      border: textFieldBorder(),
      enabledBorder: textFieldBorder(),
      focusedBorder: textFieldBorder());
}

OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
          color: Colors.white, style: BorderStyle.solid, width: 2));
}
