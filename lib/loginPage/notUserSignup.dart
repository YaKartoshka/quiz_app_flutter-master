import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../registerPage/mainScreen.dart';
import '../reusableWidgets/Responsive.dart';

Widget notUserSignup(context, appTranslations) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Register()));
      },
      child: Text(Intl.message(appTranslations['not_user']),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: setSize(context, 22))),
    ),
  );
}
