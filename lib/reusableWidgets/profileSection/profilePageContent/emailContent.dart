import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../Responsive.dart';
import 'nameContent.dart';

Widget userEmailContent(context, appTranslations, theme) {
  User? userInfo = FirebaseAuth.instance.currentUser;
  return Container(
    margin: EdgeInsets.only(
        top: setSize(context, 10),
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
              
              FontAwesomeIcons.solidEnvelope,
              color: theme == 'dark'
                ? Color.fromARGB(255, 252, 252, 252)
                : theme == 'light'
                    ? Color.fromARGB(255, 0, 0, 0)
                    : Color.fromARGB(255, 0, 0, 0),
            ),
            Padding(
              padding: EdgeInsets.all(setSize(context, 20)),
              child: textView(context, Intl.message(appTranslations['email']), theme),
            ),
          ],
        ),
        Expanded(child: textView(context, userInfo?.email, theme)),
      ],
    ),
  );
}
