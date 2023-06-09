import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants/constantString.dart';

Widget termsConditions(appTranslations) {
  return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
              text: Intl.message(appTranslations['you_agree']),
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: <TextSpan>[
              
              ])));
}
