import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../Responsive.dart';
import 'dialogBoxUpdateDatabase.dart';

Widget userPhoneContent(context, providerValue, appTranslations, theme) {
  return InkWell(
    child: Container(
        margin: margin(context),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Icon(FontAwesomeIcons.phone, color: theme == 'dark'
                ? Color.fromARGB(255, 250, 249, 249)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0),),
                Padding(
                  padding: EdgeInsets.all(setSize(context, 20)),
                  child: textView(Intl.message(appTranslations['contacts']),
                      context, theme),
                )
              ],
            ),
            Expanded(
                child: providerValue.userPhone == ""
                    ? textView("Tap to Update", context, theme)
                    : textView(providerValue.userPhone, context, theme)),
          ],
        )),
    onTap: () {
      createDialogBoxUpdate(context, providerValue,
          Intl.message(appTranslations['phone']), appTranslations);
    },
  );
}

margin(context) {
  return EdgeInsets.only(
      top: setSize(context, 10),
      right: setSize(context, 10),
      left: setSize(context, 10));
}

textView(value, context, theme) {
  return Text(
    value ?? "Tap to Update",
    style: textStyleName(context, theme),
    textAlign: TextAlign.end,
  );
}

textStyleName(context, theme) {
  return TextStyle(
      fontSize: setSize(context, 17),
      fontWeight: FontWeight.w400,
      color: theme == 'dark'
          ? Color.fromARGB(255, 250, 249, 249)
          : theme == 'light'
              ? Color.fromARGB(255, 0, 0, 0)
              : Color.fromARGB(255, 0, 0, 0),
      overflow: TextOverflow.ellipsis);
}
