import 'package:geolocator/geolocator.dart';
import 'package:mobile_attendance2/features/attendance/presentations/providers/attendance_map_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/master_data_state.dart';
import 'package:mobile_attendance2/utils/prefs_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_notifier.g.dart';

@riverpod
class AttendanceNotifier extends _$AttendanceNotifier {
  @override
  MasterDataState build() {
    _init();
    return const MasterDataState.initial();
  }

  _init() {}

  Future<String> checkIn() async {
    // jika > 50 meter dari pin location, maka reject attendancenya
    var latlong = ref.read(attendanceMapNotifierProvider.notifier).getLatLong();

    var savedLatLong = await prefsGetLatLng();
    if (latlong?.latitude != null) {
      double distanceInMeters = Geolocator.distanceBetween(
        latlong!.latitude,
        latlong!.longitude,
        savedLatLong!.latitude!,
        savedLatLong!.longitude!,
      );

      if (distanceInMeters > 50) {
        return 'Error: Current location is more than 50 meters away from the pin location.';
      } else {
        return 'Success: Current location is within 50 meters of the pin location.';
      }
    } else {
      return Future.error('Pin location is not set yet');
    }
  }
}
