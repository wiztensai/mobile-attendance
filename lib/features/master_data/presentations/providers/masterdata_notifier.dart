import 'package:mobile_attendance2/features/homepage/presentations/providers/homepage_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/states/master_data_state.dart';
import 'package:mobile_attendance2/features/master_data/presentations/providers/masterdata_map_notifier.dart';
import 'package:mobile_attendance2/utils/prefs_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'masterdata_notifier.g.dart';

@riverpod
class MasterdataNotifier extends _$MasterdataNotifier {
  @override
  MasterDataState build() {
    _init();
    return MasterDataState.initial();
  }

  _init() {}

  setLocation() async {
    var latlong = ref.read(masterdataMapNotifierProvider.notifier).getLatLong();
    if (latlong?.latitude != null) {
      await prefsSetLatLng(latlong!.latitude, latlong.longitude);
      await ref.read(homepageNotifierProvider.notifier).checkSavedLocation();
    }
  }
}
