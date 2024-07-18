import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/location_perms_state.dart';
import 'package:mobile_attendance2/utils/popup_utils.dart';
import 'package:mobile_attendance2/widgets/my_buttons.dart';

Future<int> checkPermission() async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => AlertDialog(
//         title: null,
//         content: const Text("""
// Mohon nyalakan lokasi di pengaturan.
// """),
//         actions: [
//           ElevatedButton(
//             onPressed: () async {
//               final res = await Geolocator.openLocationSettings();
//               if (res) {
//                 PopupUtils.closeDialog(context);
//               }
//             },
//             child: Text('Buka Pengaturan Lokasi'),
//           )
//         ],
//       ),
//     );

    return LocationPermissionConst.SERVICE_NOT_ENABLE;
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
//       showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (context) => AlertDialog(
//           title: null,
//           content: const Text("""
// Izin lokasi ditolak. Mohon aktifkan untuk menikmati keseluruhan fitur.

// Cara untuk mengizinkan akses lokasi:
// 1. Buka 'Setting'
// 2. Pilih 'Izin'
// 3. Izinkan 'Lokasi'
// """),
//           actions: [
//             ElevatedButton(
//               onPressed: () async {
//                 final res = await Geolocator.openAppSettings();
//                 if (res) {
//                   PopupUtils.closeDialog(context);
//                 }
//               },
//               child: Text('Buka Setting'),
//             )
//           ],
//         ),
//       );
      return LocationPermissionConst.LocationPermissiondeniedForever;
    }

    if (permission == LocationPermission.denied) {
      // showDialog(
      //   barrierDismissible: false,
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: null,
      //     content: const Text(
      //         'Mohon izinkan untuk akses lokasi untuk menikmati keseluruhan fitur'),
      //     actions: [
      //       MyButtonPrimary(
      //         onPressed: () async {
      //           PopupUtils.closeDialog(context);
      //           // await getCurrentLocation();
      //         },
      //         title: 'Izinkan Lokasi',
      //       )
      //     ],
      //   ),
      // );
      return LocationPermissionConst.LocationPermissiondenied;
    }
  }
  return LocationPermissionConst.ENABLED;
}
