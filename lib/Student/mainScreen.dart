import 'package:flutter/material.dart';
import 'package:flutter_project/providers/themeProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../appLocalization';
import '../providers/localProvider.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/appBar.dart';
import '../reusableWidgets/topBar/topBarStudent.dart';
import 'assignedTeachers/teachersAssigned.dart';
import 'navigationDrawer/drawerMain.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  
  @override
  Widget build(BuildContext context) {
     final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _){
        final theme=themeProvider.theme;
        return Scaffold(
          backgroundColor: theme == 'dark'
            ? const Color.fromARGB(255, 19, 18, 18)
            : theme == 'light'
                ? Color.fromARGB(255, 225, 220, 220)
                : Color.fromARGB(255, 255, 255, 255),
      appBar: ResponsiveWidget.isLargeScreen(context)
          ? PreferredSize(preferredSize: Size(screenWidth(context), 70), child: const TopBarStudent())
          : appBarWithLogout(context, Intl.message(appTranslations['student_homescreen'])),
      drawer: navigationDrawerStudent(context),
      body: teachersAssigned(context),
    );
      }
       );
  }
}
