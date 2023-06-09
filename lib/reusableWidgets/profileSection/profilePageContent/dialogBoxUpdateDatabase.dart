import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Responsive.dart';
import '../provider.dart';

final formKey = GlobalKey<FormState>();
createDialogBoxUpdate(context, providerValue, updateValue, appTranslations) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(updateValue),
        content: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              contentOfAlertBox(context, providerValue, updateValue, appTranslations),
              const SizedBox(height: 10),
              buttonForSave(formKey, appTranslations)
            ],
          ),
        ),
      );
    },
  );
}

// Content of Alert Dialog Box..................
contentOfAlertBox(context, providerValue, updateValue, appTranslations) {
  return SizedBox(
    width: screenWidth(context),
    child: TextFormField(
      textCapitalization: updateValue == Intl.message(appTranslations['experience'])
          ? TextCapitalization.words
          : TextCapitalization.sentences,
      keyboardType:
          updateValue == Intl.message(appTranslations['phone']) ? TextInputType.phone : TextInputType.text,
      initialValue: updateValue == Intl.message(appTranslations['your_description'])
          ? providerValue.about
          : updateValue == Intl.message(appTranslations['experience'])
              ? providerValue.experience
              : updateValue == Intl.message(appTranslations['phone'])
                  ? providerValue.userPhone
                  : providerValue.qualification,
      decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

      validator: updateValue == Intl.message(appTranslations['phone'])? (value) {
        if(value?.length != 10) {
          return "Please enter valid mobile number";
        }
      } : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: updateValue != Intl.message(appTranslations['phone']) ? 10 : 1,
      minLines: 1,
      maxLength: updateValue == Intl.message(appTranslations['phone']) ? 10 : 500,
      onChanged: (value) {
        updateValue == Intl.message(appTranslations['your_description'])
            ? providerValue.getAbout(value)
            : updateValue == Intl.message(appTranslations['experience'])
                ? providerValue.getExperience(value)
                : updateValue == Intl.message(appTranslations['phone'])
                    ? providerValue.getUserPhone(value)
                    : providerValue.getQualification(value);
      },
    ),
  );
}

// Button To update...................................
buttonForSave(GlobalKey<FormState> formKey, appTranslations) {
  return Consumer<ProfilePageProvider>(
    builder: (context, proValue, child) {
      return ElevatedButton(
          onPressed: () {
           if (formKey.currentState!.validate()) {
             String? email = FirebaseAuth.instance.currentUser?.email
                 .toString();

             Map<String, String> updatedData = {
               "about": proValue.about,
               "experience": proValue.experience,
               "qualification": proValue.qualification,
               "contact": proValue.userPhone,
             };
             FirebaseFirestore.instance
                 .collection("users")
                 .doc(email)
                 .update(updatedData);
             Navigator.pop(context);
           }
          },
          child: Text(Intl.message(appTranslations['save'])));
    },
  );
}
