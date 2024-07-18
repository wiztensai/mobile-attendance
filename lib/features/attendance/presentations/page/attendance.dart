import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_attendance2/features/attendance/presentations/components/attendance_map.dart';
import 'package:mobile_attendance2/features/attendance/presentations/providers/attendance_map_notifier.dart';
import 'package:mobile_attendance2/features/attendance/presentations/providers/attendance_notifier.dart';
import 'package:mobile_attendance2/widgets/dialog_status.dart';
import 'package:mobile_attendance2/widgets/my_buttons.dart';

class Attendance extends HookConsumerWidget {
  const Attendance({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Attendance'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AttendanceMap(),
            SizedBox(
              height: 24,
            ),
            MyButtonPrimary(
              title: 'Attend In',
              onPressed: () async {
                var mlatLng = ref
                    .read(attendanceMapNotifierProvider.notifier)
                    .getLatLong();
                if (mlatLng == null) {
                  log('latlng null');
                } else {
                  log('latlng exist');

                  var textStatus = await ref
                      .read(attendanceNotifierProvider.notifier)
                      .checkIn();

                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: DialogStatus(status: textStatus),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
