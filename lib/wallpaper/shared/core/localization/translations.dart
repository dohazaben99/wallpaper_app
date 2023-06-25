import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:my_eyesight/wallpaper/shared/core/localization/languages/ar.dart';
import 'package:my_eyesight/wallpaper/shared/core/localization/languages/en.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
