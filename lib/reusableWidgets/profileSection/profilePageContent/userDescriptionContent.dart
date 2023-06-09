import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Responsive.dart';
import 'dialogBoxUpdateDatabase.dart';

Widget userDescriptionContent(context, providerValue, appTranslations, theme) {
  return InkWell(
    child: Container(
      padding: EdgeInsets.all(setSize(context, 10)),
      child: Column(
        children: [
          headingDescription(context, Intl.message(appTranslations['your_description']),theme),
          providerValue.about == ""
              ? contentDescription("Tap to Update", context, theme)
              : contentDescription(providerValue.about, context, theme),
        ],
      ),
    ),
    onTap: () {
      createDialogBoxUpdate(context, providerValue, Intl.message(appTranslations['your_description']), appTranslations);
    },
  );
}

Text contentDescription(providerValue, context, theme) {
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
    textAlign: TextAlign.justify,
  );
}

Container headingDescription(context, value, theme) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: setSize(context, 10)),
      child: Text(value,
          style: TextStyle(
              fontSize: setSize(context, 20),
              color: theme == 'dark'
                ? Color.fromARGB(255, 250, 249, 249)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w500)));
}
