import 'package:flutter/material.dart';

class LanguageChangeAlertDialog extends StatelessWidget {
  final String message;

  const LanguageChangeAlertDialog({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('chage_lang'),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text('yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text('no'),
        ),
      ],
    );
  }
}
