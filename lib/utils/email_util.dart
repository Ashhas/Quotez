import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:open_mail_app/open_mail_app.dart';

import 'package:quotez/utils/constants.dart';
import 'package:quotez/utils/ui_strings.dart';

abstract class EmailUtil {
  /// Try and send an email using the [open_mail_app] package.
  static Future<void> sendEmail(BuildContext context) async {
    final result = await OpenMailApp.composeNewEmailInMailApp(
      emailContent: EmailContent(
        to: [Constants.developerEmail],
        subject: Constants.emailSubjectTemplate,
      ),
    );

    // If no mail apps found, show error.
    if (!result.didOpen && !result.canOpen) {
      log(UiStrings.noEmailApp);
      // iOS: if multiple mail apps found, show dialog to select.
      // There is no native intent/default app system in iOS so
      // you have to do it yourself.
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }
}
