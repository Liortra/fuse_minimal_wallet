import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralAlertDialog {
  static Future<void> show(
      {required BuildContext context,
        String? title,
        String? message,
        String? buttonTxt,
        Function? onClick}) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(title!),
          content: Text(message!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onClick?.call();
              },
              child: Text(buttonTxt!),
            ),
          ],
        )
    );
  }
}
