import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Quên mật khẩu',
    content:
        'Xin vui lòng kiểm tra và xác nhận đường dẫn được cung cấp tại hộp thư email của bạn.',
    optionsBuilder: () => {
      'Đồng ý': null,
    },
  );
}
