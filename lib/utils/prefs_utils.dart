import 'package:mobile_attendance2/utils/const_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatLngType {
  double? latitude;
  double? longitude;

  LatLngType({
    this.latitude,
    this.longitude,
  });
}

Future<LatLngType?> prefsGetLatLng() async {
  final prefs = await SharedPreferences.getInstance();
  var latitude = prefs.getDouble(CONST.SAVED_LATITUDE);
  var longitude = prefs.getDouble(CONST.SAVED_LONGITUDE);

  if (latitude == null) {
    return null;
  } else {
    return LatLngType(latitude: latitude, longitude: longitude);
  }
}

Future<void> prefsSetLatLng(double latitude, double longitude) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble(CONST.SAVED_LATITUDE, latitude);
  await prefs.setDouble(CONST.SAVED_LONGITUDE, longitude);
}

Future<void> prefsClearLatLng() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(CONST.SAVED_LATITUDE);
  await prefs.remove(CONST.SAVED_LONGITUDE);
}
