import 'package:silver_clinics/constants/app_imports.dart';

class AppPages {
  static List<GetPage> getPages = [
    GetPage(
      name: AppStrings.homeRoute,
      page: () => const HomeDrawerScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppStrings.clinicDetailsRoute,
      page: () => const ClinicsDetailsScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
