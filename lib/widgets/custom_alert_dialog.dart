import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customDialg {
  final String title;
  final String content;
  final BuildContext context;
  customDialg({required this.title, required this.content, required this.context});

   showAlertDialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
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
