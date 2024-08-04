import 'package:geocoding/geocoding.dart';

Future<String?> getLocationTownName(double latitude, double longitude) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);

  String? mostDetailedAddress;
  int highestPriority = 6; // 초기 우선순위를 가장 낮은 값으로 설정

  for (Placemark place in placeMarks) {
    String? address;
    int priority = 6;

    if (place.subThoroughfare != null &&
        place.subThoroughfare!.isNotEmpty &&
        !RegExp(r'\d').hasMatch(place.subThoroughfare!) &&
        !place.subThoroughfare!.contains('Unnamed')) {
      address = place.subThoroughfare;
      priority = 1;
    } else if (place.thoroughfare != null &&
        place.thoroughfare!.isNotEmpty &&
        !RegExp(r'\d').hasMatch(place.thoroughfare!) &&
        !place.thoroughfare!.contains('Unnamed')) {
      address = place.thoroughfare;
      priority = 2;
    } else if (place.subLocality != null &&
        place.subLocality!.isNotEmpty &&
        !RegExp(r'\d').hasMatch(place.subLocality!) &&
        !place.subLocality!.contains('Unnamed')) {
      address = place.subLocality;
      priority = 3;
    } else if (place.locality != null &&
        place.locality!.isNotEmpty &&
        !place.locality!.contains('Unnamed')) {
      address = place.locality;
      priority = 4;
    } else if (place.subAdministrativeArea != null &&
        place.subAdministrativeArea!.isNotEmpty &&
        !place.subAdministrativeArea!.contains('Unnamed')) {
      address = place.subAdministrativeArea;
      priority = 5;
    } else if (place.administrativeArea != null &&
        place.administrativeArea!.isNotEmpty &&
        !place.administrativeArea!.contains('Unnamed')) {
      address = place.administrativeArea;
      priority = 6;
    }

    if (priority < highestPriority) {
      highestPriority = priority;
      mostDetailedAddress = address;
    }
  }

  return mostDetailedAddress;
}
