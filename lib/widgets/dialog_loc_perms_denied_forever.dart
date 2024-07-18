import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_attendance2/utils/popup_utils.dart';

class DialogLocPermsDeniedForever extends HookConsumerWidget {
  const DialogLocPermsDeniedForever({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: null,
      content: const Text("""
Izin lokasi ditolak. Mohon aktifkan untuk menikmati keseluruhan fitur.

Cara untuk mengizinkan akses lokasi:
1. Buka 'Setting'
2. Pilih 'Izin'
3. Izinkan 'Lokasi'
"""),
      actions: [
        ElevatedButton(
          onPressed: () async {
            final res = await Geolocator.openAppSettings();
            if (res) {
              PopupUtils.closeDialog(context);
            }
          },
          child: Text('Buka Setting'),
        )
      ],
    );
  }
}
