import 'package:geocoding/geocoding.dart';

Future<String?> getLocationCountryCode(double latitude, double longitude) async {
  try {
    List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
    if(placeMarks.isNotEmpty) {
      return placeMarks.first.isoCountryCode;
    }else {
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

main() async {
  await getLocationCountryCode(37.7749, -122.4194);
}