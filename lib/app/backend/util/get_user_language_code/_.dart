import 'dart:ui';

String getUserLanguageCode() {
  return PlatformDispatcher.instance.locale.languageCode;
}