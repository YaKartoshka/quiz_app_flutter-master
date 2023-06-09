import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../appLocalization';
import '../../providers/localProvider.dart';
import '../../providers/themeProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/drawerHeading.dart';
import 'drawerBody.dart';

Drawer navigationDrawerStudent(context) {
   final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
      final themeProvder=Provider.of<ThemeProvider>(context);
     final theme=themeProvder.theme;
  return Drawer(
    backgroundColor: theme == 'dark'
            ? Color.fromARGB(255, 157, 155, 155)
            : theme == 'light'
                ? Color.fromARGB(255, 225, 220, 220)
                : Color.fromARGB(255, 255, 255, 255),
    elevation: 20,
    width: screenWidth(context) / 1.6,
    child: SingleChildScrollView(
      child: Column(
        children: [
          drawerHeader(context),
          listTileMyQuiz(context),
          listTileCheckScore(context),
          listTileProfile(context),
          listTileAbout(context),
          listTileShare(context),
        ],
      ),
    ),
  );
}
