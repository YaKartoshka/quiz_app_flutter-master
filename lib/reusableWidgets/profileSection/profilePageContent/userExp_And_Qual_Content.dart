import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../Responsive.dart';
import 'dialogBoxUpdateDatabase.dart';

Widget userExperienceContent(context, providerValue, appTranslations, theme) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.all(setSize(context, 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.solidStar, color: theme == 'dark'
                ? Color.fromARGB(255, 250, 249, 249)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0)),
              Padding(
                padding: EdgeInsets.all(setSize(context, 20)),
                child: textForHeading(Intl.message(appTranslations['experience']), context, theme),
              ),
            ],
          ),
          Expanded(
              child: providerValue.experience == ""
                  ? textForHeading("Tap to Update", context, theme)
                  : textForHeading(providerValue.experience, context, theme)),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, Intl.message(appTranslations['experience']), appTranslations);
    },
  );
}

Widget userQualificationContent(context, providerValue, appTranslations, theme) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.all(setSize(context, 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.graduationCap, color: theme == 'dark'
                ? Color.fromARGB(255, 250, 249, 249)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0),),
              Padding(
                padding: EdgeInsets.all(setSize(context, 20)),
                child: textForHeading(Intl.message(appTranslations['qualification']), context, theme),
              ),
            ],
          ),
          Expanded(
              child: providerValue.qualification == ""
                  ? textForHeading("Tap to Update", context, theme)
                  : textForHeading(providerValue.qualification, context, theme)),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, Intl.message(appTranslations['qualification']), appTranslations);
    },
  );
}

Text textForHeading(providerValue, context, theme) {
  return Text(
    providerValue,
    style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
        color: theme == 'dark'
                ? Color.fromARGB(255, 250, 249, 249)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0),
        overflow: TextOverflow.visible),
    textAlign: TextAlign.end,
  );
}
