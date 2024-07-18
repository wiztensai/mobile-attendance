import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/location_perms_state.dart';

part 'masterdata_map_state.freezed.dart';

@freezed
class MasterdataMapState with _$MasterdataMapState {
  const factory MasterdataMapState.initial() = _Initial;
  const factory MasterdataMapState.currentLoc(LatLng latLng) = _CurrentLoc;
}
