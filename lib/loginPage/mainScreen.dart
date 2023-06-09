import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../appLocalization';
import '../constants/constantString.dart';
import '../providers/localProvider.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/createColor.dart';
import 'notUserSignup.dart';
import 'submitButton.dart';
import 'textFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
        final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: screenWidth(context),
          height: screenHeight(context),
          decoration: pageDecoration(),
          //See Below.........
          child: SingleChildScrollView(
            child: bodyContainer(appTranslations), // See below..........
          )),
    );
  }

  Container bodyContainer(appTranslations) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenWidth(context)
          : screenWidth(context) / 2,
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoApp(),
          loginText(context, appTranslations), // See below.........
          textFieldEmail(appTranslations), // See textFields.dart..................
          textFieldPassword(appTranslations), // See textFields.dart..................
          submitButton(appTranslations), // See submitButton.dart..................
          notUserSignup(context, appTranslations), //See notUserSignup.dart..............
        ],
      ),
    );
  }

  logoApp() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.7)),
      margin: const EdgeInsets.only(bottom: 50),
      width: 150,
      child: Image.asset(
        appLogo,
        height: 130,
        width: 150,
      ),
    );
  }
}

Widget loginText(context, appTranslations) {
  return Container(
    decoration: BoxDecoration(
        color: hexToColor("#079375"),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20)),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Text(Intl.message(appTranslations['login']),
        style: TextStyle(
            fontSize: setSize(context, 30),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.normal)),
  );
}

BoxDecoration pageDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(colors: [
    Colors.redAccent,
    Colors.orange,
    Colors.grey,
    Colors.brown,
    Colors.blueAccent,
    Colors.blue,
  ], stops: [
    0.1,
    0.2,
    0.3,
    0.5,
    0.9,
    1
  ], begin: Alignment.bottomLeft, end: Alignment.topRight));
}
