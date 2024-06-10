import 'package:silver_clinics/constants/app_imports.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ClinicsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeDrawerController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AnalysisLabController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ClinicsDetailsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddressesAndWorkingHoursController(),
      fenix: true,
    );
  }
}
