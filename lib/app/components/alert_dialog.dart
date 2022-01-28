import 'package:flutter/material.dart';

showAlertDialog({context, String? title, String? message, String? textButton, Function? onConfirmed, Function? onCancel}) async {
  return showDialog<bool>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? "Base Source Dialog"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message ?? "hello world!!"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(textButton ?? "OK"),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  ).then((value) {
    if (value == null || !value) {
      if (onCancel != null) {
        onCancel();
      }
      return false;
    } else {
      if (onConfirmed != null) {
        onConfirmed();
      }
      return true;
    }
  });
}
