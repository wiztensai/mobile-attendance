import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_attendance2/features/homepage/presentations/providers/homepage_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/components/masterdata_map.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/location_perms_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/location_perms_state.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/masterdata_map_state.dart';
import 'package:mobile_attendance2/utils/permission_utils.dart';
import 'package:mobile_attendance2/utils/prefs_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'masterdata_map_notifier.g.dart';

@riverpod
class MasterdataMapNotifier extends _$MasterdataMapNotifier {
  @override
  MasterdataMapState build() {
    init();
    return MasterdataMapState.initial();
  }

  LatLng? _mLatLong;
  bool isDialogVisible = false;

  init() async {
    var res = await prefsGetLatLng();
    if (res == null) {
      await getCurrentLocation();
    } else {
      var longlat = LatLng(res.latitude ?? 0, res.longitude ?? 0);
      state = MasterdataMapState.currentLoc(longlat);
    }
  }

  final MapController _mapController = MapController();
  void _centerMap(LatLng latLng) {
    // bugfix: You need to have the FlutterMap widget rendered at least once before using the MapController
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.move(latLng, INITIAL_ZOOM);
    });
  }

  setLatLong(LatLng latlng) {
    state = MasterdataMapState.currentLoc(latlng);
    _mLatLong = latlng;

    if (_mLatLong != null) {
      _centerMap(_mLatLong!);
    }
  }

  LatLng? getLatLong() {
    if (_mLatLong == null) {
      return null;
    } else {
      return _mLatLong;
    }
  }

  getMapController() {
    return _mapController;
  }

  resetLatLong() async {
    await prefsClearLatLng();
    await getCurrentLocation();
    ref.read(homepageNotifierProvider.notifier).dataLatlongNotExist();
    if (_mLatLong != null) {
      _centerMap(_mLatLong!);
    }
  }

  Future<void> getCurrentLocation() async {
    var res = await checkPermission();

    if (res == LocationPermissionConst.ENABLED) {
      Position loc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      var longitude = loc.longitude;
      var latitude = loc.latitude;

      var longlat = LatLng(latitude, longitude);
      setLatLong(longlat);
      ref
          .read(locationPermsNotifierProvider.notifier)
          .setStatus(LocationPermissionConst.ENABLED);
      isDialogVisible = false;
    } else {
      ref.read(locationPermsNotifierProvider.notifier).setStatus(res);
      isDialogVisible = true;
    }
  }
}
