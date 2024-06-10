import 'package:silver_clinics/constants/app_imports.dart';

class AppDefaults {
  static OutlineInputBorder defaultInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? AppColors.white,
      ),
    );
  }

  static Future<bool?> defaultToast(String text) {
    return Fluttertoast.showToast(
      msg: text,
      backgroundColor: AppColors.black,
      textColor: AppColors.white,
      fontSize: 14,
    );
  }
}
