import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/location_perms_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/location_perms_state.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/masterdata_map_state.dart';
import 'package:mobile_attendance2/utils/permission_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_map_notifier.g.dart';

@riverpod
class AttendanceMapNotifier extends _$AttendanceMapNotifier {
  @override
  MasterdataMapState build() {
    init();
    return MasterdataMapState.initial();
  }

  LatLng? _mLatLong;
  bool isDialogVisible = false;

  init() async {
    await getCurrentLocation();
  }

  setLatLong(LatLng latlng) {
    state = MasterdataMapState.currentLoc(latlng);
    _mLatLong = latlng;
  }

  LatLng? getLatLong() {
    if (_mLatLong == null) {
      return null;
    } else {
      return _mLatLong;
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
