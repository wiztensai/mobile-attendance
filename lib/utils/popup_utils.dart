import 'package:flutter/material.dart';

class PopupUtils {
  static closeDialog(BuildContext context) {
    // context.popRoute();
    Navigator.of(context).pop(context);
  }
}
