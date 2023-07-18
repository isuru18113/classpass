import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class customDialg {
  final String title;
  final String content;
  final BuildContext context;
  customDialg({required this.title, required this.content, required this.context});

   showAlertDialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text(AppLocalizations.of(context)!.button_ok),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
