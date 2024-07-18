import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_attendance2/utils/popup_utils.dart';
import 'package:mobile_attendance2/widgets/my_buttons.dart';

class DialogLocPermsDenied extends HookConsumerWidget {
  const DialogLocPermsDenied({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: null,
      content: const Text(
          'Mohon izinkan untuk akses lokasi untuk menikmati keseluruhan fitur'),
      actions: [
        MyButtonPrimary(
          onPressed: () async {
            PopupUtils.closeDialog(context);
            // await getCurrentLocation();
          },
          title: 'Izinkan Lokasi',
        )
      ],
    );
  }
}
