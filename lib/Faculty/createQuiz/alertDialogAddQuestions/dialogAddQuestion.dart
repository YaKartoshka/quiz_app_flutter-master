import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../appLocalization';
import '../../../providers/createQuizProvider.dart';
import '../../../providers/localProvider.dart';
import 'alertDialogActions.dart';
import 'alertDialogContent.dart';

// +AddQuestions button in Main screen
Widget addQuestionsButton(context) {
  return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          dialogBuilder(context);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ));
}

Future dialogBuilder(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Consumer<CreateQuizProvider>(
        builder: (context, providerValue, child) {
          return alertDialogBoxAddQuestions(context, providerValue);
        },
      );
    },
  );
}

Widget alertDialogBoxAddQuestions(context, providerValue) {
   final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale;
    final appTranslations = AppTranslations.translations['${currentLocale}']!;
  return Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AlertDialog(
        scrollable: true,
        elevation: 10,
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.all(20),
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(child: Text(Intl.message(appTranslations['question']))),
        content: contentOfAlertDialogBox(context, providerValue, appTranslations),
        actions: [actionsOfAlertDialogBox(context, providerValue, appTranslations)],
      ),
    ),
  );
}
