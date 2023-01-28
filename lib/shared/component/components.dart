import 'package:flutter/material.dart';

showLoding(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  Spacer(),
                  Text(message),
                ],
              ),
            ),
          ));
}

hideLoding(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(BuildContext context, String message, String posBtn,
    VoidCallback posAction) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(message),
            actions: [
              TextButton(onPressed: posAction, child: Text(posBtn)),
            ],
          ));
}
