import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_perms_state.freezed.dart';

@freezed
class LocationPermsState with _$LocationPermsState {
  const factory LocationPermsState.initial() = _Initial;
  const factory LocationPermsState.serviceEnabled() = _ServiceEnabled;
  const factory LocationPermsState.serviceNotEnable() = _ServiceNotEnable;
  const factory LocationPermsState.denied() = _Denied;
  const factory LocationPermsState.deniedForever() = _DeniedForever;
}

class LocationPermissionConst {
  static const ENABLED = 7;
  static const SERVICE_NOT_ENABLE = 1;
  static const LocationPermissiondenied = 2;
  static const LocationPermissiondeniedForever = 3;
}
