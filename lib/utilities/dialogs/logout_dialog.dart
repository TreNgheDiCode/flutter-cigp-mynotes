import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Đăng xuất',
    content: 'Bạn có chắc chắn muốn đăng xuất không?',
    optionsBuilder: () => {
      'Quay lại': false,
      'Đăng xuất': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
