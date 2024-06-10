import 'package:silver_clinics/constants/app_imports.dart';

class HomeDrawerScreen extends GetWidget<HomeDrawerController> {
  const HomeDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: controller.scaffoldKey,
          drawer: Drawer(
            backgroundColor: AppColors.white,
            width: MediaQuery.of(context).size.width * 0.75,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(AppStrings.appLogoLogo),
                  ),
                  Text(
                    AppStrings.appTitleArabic,
                    style: AppFonts.boldNavyBlue20.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  const Divider(
                    color: AppColors.navyBlue,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.menusList.length,
                    itemBuilder: (BuildContext context, int index) {
                      MenuModel menu = controller.menusList[index];
                      return ListTile(
                        onTap: () {
                          controller.currentMenu.value = menu;
                          Navigator.pop(context);
                        },
                        leading: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(menu.icon),
                        ),
                        title: Text(
                          menu.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.boldNavyBlue20,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const GapWidget(10);
                    },
                  ),
                  const Divider(
                    color: AppColors.navyBlue,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Text(
                    AppStrings.socialMediaPlatformsText,
                    style: AppFonts.boldNavyBlue20.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const GapWidget(10),
                  SizedBox(
                    height: 20,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.socialMediaPlatformList.length,
                      itemBuilder: (BuildContext context, int index) {
                        SocialMediaPlatformModel socialMediaPlatform = controller.socialMediaPlatformList[index];
                        return InkWell(
                          onTap: () => launch(socialMediaPlatform.link),
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(socialMediaPlatform.icon),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: AppColors.navyBlue,
                            width: 25,
                            indent: 5,
                            endIndent: 5,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.navyBlue,
                  AppColors.dodgerBlue,
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => controller.scaffoldKey.currentState?.openDrawer(),
                          child: const Icon(
                            Icons.sort_rounded,
                            color: AppColors.white,
                          ),
                        ),
                        const GapWidget(20),
                        Obx(
                          () {
                            return Text(
                              controller.currentMenu.value.title,
                              style: AppFonts.boldWhite20,
                            );
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 55,
                          height: 55,
                          child: Image.asset(AppStrings.appLogoLogo),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 90,
                  child: Obx(
                    () {
                      return controller.currentMenu.value.body;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
