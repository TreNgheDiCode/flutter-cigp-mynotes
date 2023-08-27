import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Xóa ghi chú',
    content: 'Bạn có chắc chắn muốn xóa ghi chú này không?',
    optionsBuilder: () => {
      'Quay lại': false,
      'Đồng ý': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
