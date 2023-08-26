import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String message,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Lỗi!'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Đồng ý'),
          )
        ],
      );
    },
  );
}
