import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'master_data_state.freezed.dart';

@freezed
class MasterDataState with _$MasterDataState {
  const factory MasterDataState.initial() = _Initial;
  const factory MasterDataState.currentLoc(LatLng latLng) = _CurrentLoc;
}
