import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Chia sẻ ghi chú',
    content:
        'Ghi chú hiện đang trống, xin vui lòng nhập nội dung cho ghi chú trước',
    optionsBuilder: () => {
      'Đồng ý': null,
    },
  );
}
