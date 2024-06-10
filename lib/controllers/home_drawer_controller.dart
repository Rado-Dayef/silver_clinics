import 'package:silver_clinics/constants/app_imports.dart';
import 'package:silver_clinics/views/screens/home_screen.dart';

class HomeDrawerController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<MenuModel> currentMenu = Rx<MenuModel>(
    const MenuModel(
      AppStrings.homeScreenText,
      icon: AppStrings.homeIcon,
      body: HomeScreen(),
    ),
  );
  List<SocialMediaPlatformModel> socialMediaPlatformList = [
    const SocialMediaPlatformModel(
      AppStrings.whatsappIcon,
      link: AppStrings.whatsappLink,
    ),
    const SocialMediaPlatformModel(
      AppStrings.facebookIcon,
      link: AppStrings.facebookLink,
    ),
    const SocialMediaPlatformModel(
      AppStrings.instagramIcon,
      link: AppStrings.instagramLink,
    ),
    const SocialMediaPlatformModel(
      AppStrings.telegramIcon,
      link: AppStrings.telegramLink,
    ),
  ];
  List<MenuModel> menusList = [
    const MenuModel(
      AppStrings.homeScreenText,
      icon: AppStrings.homeIcon,
      body: HomeScreen(),
    ),
    const MenuModel(
      AppStrings.analysisLabText,
      icon: AppStrings.analysisLabIcon,
      body: AnalysisLabScreen(),
    ),
    const MenuModel(
      AppStrings.clinicsText,
      icon: AppStrings.clinicsIcon,
      body: ClinicsScreen(),
    ),
    const MenuModel(
      AppStrings.addressesAndWorkingHoursText,
      icon: AppStrings.addressesAndWorkingHoursIcon,
      body: AddressesAndWorkingHoursScreen(),
    ),
  ];
}
