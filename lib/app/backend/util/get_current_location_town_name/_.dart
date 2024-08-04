import 'package:geocoding/geocoding.dart';

Future<String?> getLocationTownName(double latitude, double longitude) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
  if (placeMarks.isNotEmpty) {
    Placemark place = placeMarks[0];
    return _getFormattedAddress(place);
  } else {
    return null;
  }
}

String _getFormattedAddress(Placemark place) {
  if (place.subThoroughfare != null &&
      place.subThoroughfare!.isNotEmpty &&
      !RegExp(r'\d').hasMatch(place.subThoroughfare!) &&
      !place.subThoroughfare!.contains('Unnamed')) {
    return '${place.subThoroughfare}';
  }
  if (place.thoroughfare != null &&
      place.thoroughfare!.isNotEmpty &&
      !RegExp(r'\d').hasMatch(place.thoroughfare!) &&
      !place.thoroughfare!.contains('Unnamed')) {
    return '${place.thoroughfare}';
  }
  if (place.subLocality != null &&
      place.subLocality!.isNotEmpty &&
      !RegExp(r'\d').hasMatch(place.subLocality!) &&
      !place.subLocality!.contains('Unnamed')) {
    return '${place.subLocality}';
  }
  if (place.locality != null &&
      place.locality!.isNotEmpty &&
      !place.locality!.contains('Unnamed')) {
    return '${place.locality}';
  }
  if (place.subAdministrativeArea != null &&
      place.subAdministrativeArea!.isNotEmpty &&
      !place.subAdministrativeArea!.contains('Unnamed')) {
    return '${place.subAdministrativeArea}';
  }
  if (place.administrativeArea != null &&
      place.administrativeArea!.isNotEmpty &&
      !place.administrativeArea!.contains('Unnamed')) {
    return '${place.administrativeArea}';
  }
  return '';
}