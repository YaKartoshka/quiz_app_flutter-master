import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/localProvider.dart';
import '../../providers/themeProvider.dart';
import '../../reusableWidgets/appBar.dart';
import '../Responsive.dart';
import 'profilePageContent/emailContent.dart';
import 'profilePageContent/nameContent.dart';
import 'profilePageContent/userDescriptionContent.dart';
import 'profilePageContent/userExp_And_Qual_Content.dart';
import 'profilePageContent/userImageContent.dart';
import 'profilePageContent/userPhoneContent.dart';
import 'provider.dart';
import 'package:intl/intl.dart';
import '../../appLocalization';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
    final themeProvider = Provider.of<ThemeProvider>(context);
    themeProvider.fetchTheme();
    final adaptiveSize = MediaQuery.of(context).size;

    return Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProvider, themeProvider, _) {
      final theme = themeProvider.theme;
      return Scaffold(
        backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 225, 220, 220)
                : Color.fromARGB(255, 255, 255, 255),
        appBar:
            appBarSimple(context, Intl.message(appTranslations['my_profile'])),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            transformAlignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: Consumer2<ProfilePageProvider, ThemeProvider>(
              builder: (context, providerValue, themeProvider, child) {
                final theme = themeProvider.theme;
                return Container(
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? screenWidth(context)
                      : screenWidth(context) / 2,
                  child: Column(
                    children: [
                      userImageContent(context),
                      userNameContent(
                          context, providerValue, appTranslations, theme),
                      containerSeperator(context),
                      userEmailContent(context, appTranslations, theme),
                      containerSeperator(context),
                      userPhoneContent(
                          context, providerValue, appTranslations, theme),
                      containerSeperator(context),
                      providerValue.userType != "0"
                          ? userExperienceContent(
                              context, providerValue, appTranslations, theme)
                          : Container(),
                      providerValue.userType != "0"
                          ? containerSeperator(context)
                          : Container(),
                      userQualificationContent(
                          context, providerValue, appTranslations, theme),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.language,
                              size: 30,
                              color: theme == 'dark'
                                  ? Color.fromARGB(255, 250, 249, 249)
                                  : theme == 'light'
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton<Locale>(
                              dropdownColor: Colors.grey,
                              value: currentLocale,
                              onChanged: (locale) async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                localeProvider.setLocale(locale!);
                                prefs!.setString('language', '${locale}');
                              },
                              items: [
                                DropdownMenuItem<Locale>(
                                  value: Locale('kk'),
                                  child: Text(
                                    'Kazakh',
                                    style: TextStyle(
                                      color: theme == 'dark'
                                          ? Color.fromARGB(255, 250, 249, 249)
                                          : theme == 'light'
                                              ? Color.fromARGB(255, 0, 0, 0)
                                              : Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<Locale>(
                                  value: Locale('ru'),
                                  child: Text(
                                    'Russian',
                                    style: TextStyle(
                                      color: theme == 'dark'
                                          ? Color.fromARGB(255, 250, 249, 249)
                                          : theme == 'light'
                                              ? Color.fromARGB(255, 0, 0, 0)
                                              : Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<Locale>(
                                  value: Locale('en'),
                                  child: Text(
                                    'English',
                                    style: TextStyle(
                                      color: theme == 'dark'
                                          ? Color.fromARGB(255, 250, 249, 249)
                                          : theme == 'light'
                                              ? Color.fromARGB(255, 0, 0, 0)
                                              : Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 10, 0, 0),
                        child: Row(children: [
                          Icon(
                            Icons.invert_colors,
                            color: theme == 'dark'
                                ? Color.fromARGB(255, 250, 249, 249)
                                : theme == 'light'
                                    ? Color.fromARGB(255, 0, 0, 0)
                                    : Color.fromARGB(255, 0, 0, 0),
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.grey,
                            value: theme,
                            onChanged: (theme) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs?.setString('theme', '${theme}');
                              themeProvider.fetchTheme();
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: 'default',
                                child: Text(
                                  'Default',
                                  style: TextStyle(
                                    color: theme == 'dark'
                                        ? Color.fromARGB(255, 250, 249, 249)
                                        : theme == 'light'
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'light',
                                child: Text(
                                  'Light',
                                  style: TextStyle(
                                    color: theme == 'dark'
                                        ? Color.fromARGB(255, 250, 249, 249)
                                        : theme == 'light'
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'dark',
                                child: Text(
                                  'Dark',
                                  style: TextStyle(
                                    color: theme == 'dark'
                                        ? Color.fromARGB(255, 250, 249, 249)
                                        : theme == 'light'
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      containerSeperator(context),
                      userDescriptionContent(
                          context, providerValue, appTranslations, theme),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

containerSeperator(context) {
  return Container(
      width: screenWidth(context), height: 1, color: Colors.black54);
}
