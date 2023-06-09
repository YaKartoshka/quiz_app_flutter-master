import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget textFieldTitle(providerValue, appTranslations) {
  return TextFormField(
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        providerValue.getQuizTitle(value);
      },
      decoration: InputDecoration(labelText: Intl.message(appTranslations['title'])));
}

Widget textFieldDescription(providerValue, appTranslations) {
  return TextFormField(
    textCapitalization: TextCapitalization.words,
    onChanged: (value) {
      providerValue.getQuizDesc(value);
    },
    decoration: InputDecoration(labelText: Intl.message(appTranslations['description'])),
    maxLines: 3,
    minLines: 3,
  );
}

Widget textFieldQuestions(providerValue, appTranslations) {
  return TextFormField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
        label: Container(
            alignment: Alignment.centerLeft, child: Text(Intl.message(appTranslations['question'])))),
    minLines: 2,
    maxLines: 2,
    expands: false,
    onChanged: (value) {
      providerValue.getQuestionInfo(value);
    },
  );
}

Widget textFieldOption1(providerValue, appTranslations) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
          labelText: Intl.message(appTranslations['option_1']),
          labelStyle: TextStyle(color: Colors.green)),
      onChanged: (value) => providerValue.getOption1(value));
}

Widget textFieldOption2(providerValue, appTranslations) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
          labelText: Intl.message(appTranslations['option_2']),
          labelStyle: TextStyle(color: Colors.redAccent)),
      onChanged: (value) => providerValue.getOption2(value));
}

Widget textFieldOption3(providerValue, appTranslations) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
          labelText: Intl.message(appTranslations['option_3']),
          labelStyle: TextStyle(color: Colors.redAccent)),
      onChanged: (value) => providerValue.getOption3(value));
}

Widget textFieldOption4(providerValue, appTranslations) {
  return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
          labelText: Intl.message(appTranslations['option_4']),
          labelStyle: TextStyle(color: Colors.redAccent)),
      onChanged: (value) => providerValue.getOption4(value));
}