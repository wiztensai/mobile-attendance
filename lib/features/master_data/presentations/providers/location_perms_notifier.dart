import 'package:mobile_attendance2/features/master_data/presentations/states/location_perms_state.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/master_data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_perms_notifier.g.dart';

@riverpod
class LocationPermsNotifier extends _$LocationPermsNotifier {
  @override
  LocationPermsState build() {
    _init();
    return LocationPermsState.initial();
  }

  _init() {}

  setStatus(int status) {
    switch (status) {
      case LocationPermissionConst.ENABLED:
        state = LocationPermsState.serviceEnabled();
        break;
      case LocationPermissionConst.SERVICE_NOT_ENABLE:
        state = LocationPermsState.serviceNotEnable();
        break;
      case LocationPermissionConst.LocationPermissiondenied:
        state = LocationPermsState.denied();
        break;
      case LocationPermissionConst.LocationPermissiondeniedForever:
        state = LocationPermsState.deniedForever();
        break;
      default:
        state = LocationPermsState.initial();
    }
  }
}
