import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/masterdata_map_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/masterdata_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/components/masterdata_map.dart';
import 'package:mobile_attendance2/widgets/dialog_status.dart';
import 'package:mobile_attendance2/widgets/my_buttons.dart';

class Masterdata extends HookConsumerWidget {
  const Masterdata({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Master Location'),
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
            MasterdataMap(),
            SizedBox(
              height: 24,
            ),
            MyButtonPrimary(
              title: 'Set Location',
              onPressed: () async {
                var mlatLng = ref
                    .read(masterdataMapNotifierProvider.notifier)
                    .getLatLong();
                if (mlatLng == null) {
                  log('latlng null');
                } else {
                  log('latlng exist');

                  await ref
                      .read(masterdataNotifierProvider.notifier)
                      .setLocation();

                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: DialogStatus(
                          status: 'Success: The data has been saved'),
                    ),
                  );
                }
              },
            ),
            MyButtonOutline(
              title: 'Reset Location',
              onPressed: () async {
                await ref
                    .read(masterdataMapNotifierProvider.notifier)
                    .resetLatLong();

                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: DialogStatus(
                      status: 'Success: Data has been reset',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
