import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/location_perms_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/masterdata_map_notifier.dart';
import 'package:mobile_attendance2/utils/popup_utils.dart';
import 'package:mobile_attendance2/widgets/dialog_loc_perms_denied.dart';
import 'package:mobile_attendance2/widgets/dialog_loc_perms_denied_forever.dart';
import 'package:mobile_attendance2/widgets/dialog_open_location_settings.dart';
import 'package:mobile_attendance2/widgets/my_fonts.dart';

const INITIAL_ZOOM = 18.0;
const MAX_ZOOM = 22.0;

class MasterdataMap extends HookConsumerWidget {
  const MasterdataMap({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(masterdataMapNotifierProvider);

    ref.listen(
      locationPermsNotifierProvider,
      (previous, next) {
        next.when(
          initial: () {},
          serviceEnabled: () {
            var isDialogVisible = ref
                .read(masterdataMapNotifierProvider.notifier)
                .isDialogVisible;
            if (isDialogVisible) {
              PopupUtils.closeDialog(context);
            }
          },
          serviceNotEnable: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => DialogOpenLocationSettings(),
            );
          },
          denied: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => DialogLocPermsDenied(),
            );
          },
          deniedForever: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => DialogLocPermsDeniedForever(),
            );
          },
        );
      },
    );

    return FocusDetector(
        onFocusGained: () async {
          await ref.read(masterdataMapNotifierProvider.notifier).init();
        },
        child: state.when(
          initial: () => const SizedBox(
            height: 200,
            child: Center(
              child: MyFontBody(
                text: 'Loading...',
              ),
            ),
          ),
          currentLoc: (LatLng latLng) => SizedBox(
              height: 200,
              child: FlutterMap(
                mapController: ref
                    .read(masterdataMapNotifierProvider.notifier)
                    .getMapController(),
                options: MapOptions(
                  initialCenter: latLng,
                  initialZoom: INITIAL_ZOOM,
                  maxZoom: MAX_ZOOM,
                  onTap: (tapPosition, point) {
                    log('tap');

                    ref
                        .read(masterdataMapNotifierProvider.notifier)
                        .setLatLong(point);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: latLng,
                        width: 100,
                        height: 100,
                        child: const Icon(Icons.location_on, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
