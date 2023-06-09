import 'package:flutter/material.dart';
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
import '../Students Result/mainPage.dart';
import '../createQuiz/mainScreen.dart';

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
        fontSize: setSize(context, 18),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {},
  );
}

Widget listTileCreate(context) {
  final localeProvider = Provider.of<LocaleProvider>(context);
  final currentLocale = localeProvider.locale;
  final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return Consumer<ProfilePageProvider>(
    builder: (context, providerValue, child) {
      return ListTile(
        contentPadding: const EdgeInsets.only(top: 15, left: 20),
        leading: const Icon(FontAwesomeIcons.circlePlus,
            size: 20, color: Colors.black),
        title: Text(
          Intl.message(appTranslations['create_quiz']),
          style: TextStyle(
            fontSize: setSize(context, 18),
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () async {
          Navigator.pop(context);
          await getProfileInfo(providerValue);
          if (providerValue.experience == "" ||
              providerValue.qualification == "" ||
              providerValue.about == "") {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Alert",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  elevation: 20,
                  content: Text(Intl.message(appTranslations['kindly_update'])),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          Intl.message(appTranslations['cancel']),
                          style: TextStyle(fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ));
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                );
              },
            );
          } else {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateQuiz(),
                ));
          }
        },
      );
    },
  );
}

Widget listTileProfile(context) {
  final localeProvider = Provider.of<LocaleProvider>(context);
  final currentLocale = localeProvider.locale;
  final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return Container(
    child: Consumer<ProfilePageProvider>(
      builder: (context, providerValue, child) {
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 15, left: 20),
          leading: const Icon(FontAwesomeIcons.userPen,
              size: 20, color: Colors.black),
          title: Text(
            Intl.message(appTranslations['my_profile']),
            style: TextStyle(
                fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
          ),
          onTap: () async {
            await getProfileInfo(providerValue);
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
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AboutPage()));
    },
  );
}

ListTile listTileStudentResult(context) {
  final localeProvider = Provider.of<LocaleProvider>(context);
  final currentLocale = localeProvider.locale;
  final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.squarePollVertical,
        size: 20, color: Colors.black),
    title: Text(
      Intl.message(appTranslations['students_score']),
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StudentResult()));
    },
  );
}
