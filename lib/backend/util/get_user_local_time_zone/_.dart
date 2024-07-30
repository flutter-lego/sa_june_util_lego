import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<String> getUserLocalTimeZone() async {
  tz.initializeTimeZones();
  return await FlutterNativeTimezone.getLocalTimezone();
}