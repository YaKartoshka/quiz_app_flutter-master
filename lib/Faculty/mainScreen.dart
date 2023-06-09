import 'package:flutter/material.dart';
import 'package:flutter_project/reusableWidgets/Responsive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../appLocalization';
import '../providers/localProvider.dart';
import '../reusableWidgets/appBar.dart';
import '../reusableWidgets/topBar/topBarFaculty.dart';
import 'floatingButton/floatingButtonCreateQuiz.dart';
import 'navigationDrawer/drawerMain.dart';
import 'showQuiz/mainScreen.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({Key? key}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
    return Scaffold(
      appBar: ResponsiveWidget.isLargeScreen(context)
          ? PreferredSize(preferredSize: Size(screenWidth(context), 70), child: const TopBarFaculty())
          : appBarWithLogout(context, Intl.message(appTranslations['my_quizzes'])),
      floatingActionButton: floatingButtonCreate(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: navigationDrawer(context),
      body: showQuiz(context),
    );
  }
}
