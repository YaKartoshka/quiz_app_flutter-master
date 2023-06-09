import 'package:flutter/material.dart';
import 'package:flutter_project/appLocalization';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Faculty/createQuiz/alertDialogAddQuestions/dialogAddQuestion.dart';
import '../constants/constantString.dart';
import '../providers/localProvider.dart';
import '../providers/themeProvider.dart';
import 'Responsive.dart';
import 'alertDialogs/alertDialogLogout.dart';

AppBar appBarSimple(context, title) {
  final themeProvder = Provider.of<ThemeProvider>(context);
  final theme = themeProvder.theme;
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
    backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 252, 219, 111)
                : Colors.blueGrey,
  );
}

AppBar appBarSimpleWithoutBack(context, title) {
  final themeProvder = Provider.of<ThemeProvider>(context);
  final theme = themeProvder.theme;
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
    automaticallyImplyLeading: false,
    backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 252, 219, 111)
                : Colors.blueGrey,
  );
}

AppBar appBarCreate(context, title) {
  final themeProvder = Provider.of<ThemeProvider>(context);
  final theme = themeProvder.theme;
  final localeProvider = Provider.of<LocaleProvider>(context);
  final currentLocale = localeProvider.locale;
  final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
    backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 252, 219, 111)
                : Colors.blueGrey,
    actions: [
      addQuestionsButton(context),
    ],
  );
}

AppBar appBarWithLogout(context, title) {
  final themeProvder = Provider.of<ThemeProvider>(context);
  final theme = themeProvder.theme;
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
    actions: [
      containerLogout(context),
    ],
    backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 252, 219, 111)
                : Colors.blueGrey,
  );
}

Container containerLogout(context) {
  final localeProvider = Provider.of<LocaleProvider>(context);
  final currentLocale = localeProvider.locale;
  final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return Container(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogSignOut(context, appTranslations);
              },
            );
          },
          icon: const Icon(FontAwesomeIcons.rightFromBracket)));
}

AppBar appBarAbout(context) {
  final themeProvder = Provider.of<ThemeProvider>(context);
  final theme = themeProvder.theme;
  return AppBar(
    elevation: 20,
    backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 252, 219, 111)
                : Colors.blueGrey,
    flexibleSpace: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border(bottom: BorderSide(color: Colors.black, width: 3))),
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: screenHeight(context) / 4 / 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2)),
          child: Image.asset(
            appLogo,
          ),
        )),
    actions: [
      Container(
          padding: EdgeInsets.only(
              right: setSize(context, 20), top: setSize(context, 10)),
          child: IconButton(
              onPressed: () async {
                String mailto =
                    "mailto:arailymabaeva36@gmail.com?subject=Query Regarding Quiz Application";
                await launchUrlString(mailto,
                    mode: LaunchMode.externalApplication);
              },
              icon: Icon(
                FontAwesomeIcons.addressCard,
                size: setSize(context, 30),
              )))
    ],
  );
}
