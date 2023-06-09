import 'package:flutter/material.dart';
import 'package:flutter_project/providers/themeProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../aboutPage/mainPage.dart';
import '../../appLocalization';
import '../../constants/constantString.dart';
import '../../providers/localProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/profileSection/getProfileInfo.dart';
import '../../reusableWidgets/profileSection/mainPage.dart';
import '../../reusableWidgets/profileSection/provider.dart';
import '../checkScores/checkScores.dart';

ListTile listTileMyQuiz(context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.receipt, size: 20, color: Colors.black),
    title: Text(
      Intl.message(appTranslations['my_quiz']),
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {},
  );
}

ListTile listTileCheckScore(context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: Icon(FontAwesomeIcons.squarePollVertical,
        size: setSize(context, 17), color: Colors.black),
    title: Text(
      Intl.message(appTranslations['score']),
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CheckScore()));
    },
  );
}

Container listTileProfile(context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return Container(
    child: Consumer<ProfilePageProvider>(
      builder: (context, providervalue, child) {
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 15, left: 20),
          leading: const Icon(FontAwesomeIcons.userPen,
              size: 20, color: Colors.black),
          title: Text(
            Intl.message(appTranslations['my_profile']),
            style: TextStyle(
                fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
          ),
          onTap: () {
            getProfileInfo(providervalue);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        );
      },
    ),
  );
}

ListTile listTileAbout(context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.circleInfo, size: 20, color: Colors.black),
    title: Text(
      Intl.message(appTranslations['about_us']),
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AboutPage(),
          ));
    },
  );
}




ListTile listTileShare(context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
  
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
   
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.shareNodes, size: 20, color: Colors.black),
    title: Text(
      Intl.message(appTranslations['share']),
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      String mailto =
          "mailto:arailymabaeva36@gmail.com?subject=Query Regarding Quiz Application";
      await launchUrlString(mailto,
      mode: LaunchMode.externalApplication);
    },
  );
}
