import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Student/checkScores/checkScores.dart';
import '../../Student/mainScreen.dart';
import '../../aboutPage/mainPage.dart';
import '../../appLocalization';
import '../../constants/constantString.dart';
import '../../providers/localProvider.dart';
import '../Responsive.dart';
import '../alertDialogs/alertDialogLogout.dart';
import '../profileSection/mainPage.dart';

class TopBarStudent extends StatelessWidget {
  const TopBarStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      width: screenWidth(context),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 50),
              child:  Text(Intl.message(appTranslations['champ_quiz']),
                  style: TextStyle(color: Colors.white, fontSize: 25))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentHome()));
                    },
                    child: Text(Intl.message(appTranslations['my_quiz']),
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const CheckScore()));
                    },
                    child: Text(Intl.message(appTranslations['check_my_score']),
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
                  },
                  child: Text(Intl.message(appTranslations['my_profile']),
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
                  },
                  child: Text(Intl.message(appTranslations['about_us']),
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              
              IconButton(onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return alertDialogSignOut(context, appTranslations);
                  },
                );
              }, icon: const Icon(FontAwesomeIcons.rightFromBracket,color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
