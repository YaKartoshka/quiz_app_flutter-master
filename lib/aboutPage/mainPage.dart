import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../appLocalization';
import '../constants/constantString.dart';
import '../providers/localProvider.dart';
import '../providers/themeProvider.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/appBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
    final themeProvder=Provider.of<ThemeProvider>(context);
     final theme=themeProvder.theme;
    return Scaffold(
      backgroundColor: theme == 'dark'
            ? Color.fromARGB(255, 157, 155, 155)
            : theme == 'light'
                ? Color.fromARGB(255, 225, 220, 220)
                : Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
          preferredSize: ResponsiveWidget.isSmallScreen(context) ? Size.fromHeight(screenHeight(context) / 4) : Size.fromHeight(screenHeight(context) / 2.5),
          child: appBarAbout(context)),
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            aboutTitleContainer(appTranslations),
            aboutContainer(appTranslations),
          ],
        ),
      ),
    );
  }

  aboutTitleContainer(appTranslations) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: Text(Intl.message(appTranslations['about_us']),
          style: TextStyle(
              fontSize: 30,
              color: Colors.cyan.shade800,
              fontWeight: FontWeight.bold)),
    );
  }
  

  aboutContainer(appTranslations) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Text(Intl.message(appTranslations['about_msg']),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify),
          ),
        ],
      ),
    );
  }
}
