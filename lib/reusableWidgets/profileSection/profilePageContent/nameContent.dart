import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../Responsive.dart';
import '../provider.dart';
import 'dialogBoxUpadteCurrentUserInfo.dart';

Widget userNameContent(context, ProfilePageProvider providerValue, appTranslations, theme) {
  User? userInfo = FirebaseAuth.instance.currentUser;
  return InkWell(
    child: Container(
        margin: EdgeInsets.only(
            top: setSize(context, 50),
            right: setSize(context, 10),
            left: setSize(context, 10)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Icon(
                  FontAwesomeIcons.solidCircleUser,
                  color: theme == 'dark'
                ? Color.fromARGB(255, 250, 249, 249)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0),
                ),
                Padding(
                  padding: EdgeInsets.all(setSize(context, 20)),
                  child: textView(context, Intl.message(appTranslations['username']), theme),
                ),
              ],
            ),
            Expanded(child: textView(context, providerValue.userName, theme),),
          ],
        )),
    onTap: () {
      dialogBoxUpdateCurrentUserInfo(context, userInfo, Intl.message(appTranslations['username']), appTranslations);
    },
  );
}

Widget textView(context, value, theme) {
  return Text(
    value ?? "Tap to Update",
    style: textStyleName(context, theme),
    textAlign: TextAlign.end,
  );
}

TextStyle textStyleName(context, theme) {
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
