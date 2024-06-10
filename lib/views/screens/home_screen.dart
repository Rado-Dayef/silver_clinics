import 'package:silver_clinics/constants/app_imports.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            style: AppFonts.boldWhite20.copyWith(
              fontSize: 30,
            ),
          ),
          const GapWidget(25),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.descriptionList.length,
            itemBuilder: (BuildContext context, int index) {
              String description = controller.descriptionList[index];
              return Text(
                description,
                style: AppFonts.normalWhite20,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const GapWidget(20);
            },
          ),
        ],
      ),
    );
  }
}
