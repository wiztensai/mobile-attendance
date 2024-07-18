import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_attendance2/utils/popup_utils.dart';

class DialogOpenLocationSettings extends HookConsumerWidget {
  const DialogOpenLocationSettings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: null,
      content: const Text("""
Mohon nyalakan lokasi di pengaturan.
"""),
      actions: [
        ElevatedButton(
          onPressed: () async {
            final res = await Geolocator.openLocationSettings();
            if (res) {
              PopupUtils.closeDialog(context);
            }
          },
          child: Text('Buka Pengaturan Lokasi'),
        )
      ],
    );
  }
}
