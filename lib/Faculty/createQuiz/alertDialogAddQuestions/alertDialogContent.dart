import 'package:flutter/material.dart';

import '../../../reusableWidgets/Responsive.dart';
import '../textFieldWidgets.dart';

Widget contentOfAlertDialogBox(context, providerValue, appTranslations) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(10),
      width: screenWidth(context),
      child: Column(
        children: [
          textFieldQuestions(providerValue, appTranslations),
          Container(
            height: 30,
          ),
          textFieldOption1(providerValue, appTranslations),
          textFieldOption2(providerValue, appTranslations),
          textFieldOption3(providerValue, appTranslations),
          textFieldOption4(providerValue, appTranslations),
        ],
      ),
    ),
  );
}