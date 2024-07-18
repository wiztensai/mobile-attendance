import 'package:mobile_attendance2/features/homepage/presentations/states/homepage_state.dart';
import 'package:mobile_attendance2/utils/prefs_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homepage_notifier.g.dart';

@riverpod
class HomepageNotifier extends _$HomepageNotifier {
  @override
  HomepageState build() {
    _init();
    return HomepageState.initial();
  }

  _init() {
    checkSavedLocation();
  }

  dataLatlongNotExist() {
    state = HomepageState.initial();
  }

  Future<void> checkSavedLocation() async {
    var res = await prefsGetLatLng();
    if (res != null) {
      state = HomepageState.latlongExist();
    }
  }
}
