import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../loginPage/mainScreen.dart';
import '../Responsive.dart';
import '../profileSection/provider.dart';

AlertDialog alertDialogSignOut(context, appTranslations) {
  return AlertDialog(
    title: Text(Intl.message(appTranslations['logout_msg']),
        style: TextStyle(fontSize: setSize(context, 20))),
    elevation: 10,
    actions: [
      noPressed(context, appTranslations),
      yesPressed(context, appTranslations),
    ],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

Widget yesPressed(context, appTranslations) {
  return Consumer<ProfilePageProvider>(
    builder: (context, proValue, child) {
      return TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.clear();
            proValue.clearAllProfileData();

            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: Text(Intl.message(appTranslations['yes']), style: TextStyle(fontSize: setSize(context, 22))));
    },
  );
}

Widget noPressed(context, appTranslations) {
  return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(Intl.message(appTranslations['no']), style: TextStyle(fontSize: setSize(context, 22))));
}
