import 'package:silver_clinics/constants/app_imports.dart';

class ClinicsDetailsScreen extends GetWidget<ClinicsDetailsController> {
  const ClinicsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.white,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const GapWidget(10),
                  const Text(
                    AppStrings.doctorsText,
                    style: AppFonts.boldWhite20,
                  ),
                  const GapWidget(10),
                  Obx(
                    () {
                      return controller.doctorsList.isEmpty
                          ? const CircularProgressIndicator(
                              color: AppColors.white,
                            )
                          : CarouselSlider.builder(
                              itemCount: controller.doctorsList.length,
                              options: CarouselOptions(
                                scrollPhysics: const BouncingScrollPhysics(),
                                height: 300,
                                autoPlay: true,
                                viewportFraction: 0.5,
                                enableInfiniteScroll: true,
                                enlargeCenterPage: true,
                                pageSnapping: true,
                                autoPlayCurve: Curves.easeIn,
                                autoPlayInterval: const Duration(
                                  seconds: 5,
                                ),
                                autoPlayAnimationDuration: const Duration(
                                  seconds: 1,
                                ),
                              ),
                              itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                                DoctorsModel doctor = controller.doctorsList[index];
                                return DoctorsItemWidget(doctor);
                              },
                            );
                    },
                  ),
                  const Divider(
                    color: AppColors.white,
                    height: 50,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const Text(
                    AppStrings.specialtiesText,
                    style: AppFonts.boldWhite20,
                  ),
                  const GapWidget(10),
                  GridView.builder(
                    padding: const EdgeInsets.all(10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.clinic.specialties.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 100,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      String specialty = controller.clinic.specialties[index];
                      return Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          specialty,
                          textAlign: TextAlign.center,
                          style: AppFonts.boldNavyBlue20,
                        ),
                      );
                    },
                  ),
                  const Divider(
                    color: AppColors.white,
                    height: 50,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Text(
                    AppStrings.aboutText + AppStrings.spaceSign + controller.clinic.title,
                    style: AppFonts.boldWhite20,
                  ),
                  const GapWidget(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      controller.clinic.about,
                      style: AppFonts.normalWhite20,
                    ),
                  ),
                  const GapWidget(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Doctors item widget.
class DoctorsItemWidget extends StatelessWidget {
  final DoctorsModel doctor;

  const DoctorsItemWidget(
    this.doctor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String days = AppStrings.emptySign;

    for (int i = 0; i < doctor.days.length; i++) {
      days += doctor.days[i];
      if (i < doctor.days.length - 1) {
        days += AppStrings.spaceSign + AppStrings.scoreSign + AppStrings.spaceSign;
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(doctor.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  doctor.name + AppStrings.spaceSign + AppStrings.openingParenthesisSign + doctor.specialty + AppStrings.closingParenthesisSign,
                  textAlign: TextAlign.center,
                  style: AppFonts.boldNavyBlue20.copyWith(
                    fontSize: 16,
                  ),
                ),
                const GapWidget(3),
                ReadMoreText(
                  days,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: AppStrings.showMoreText,
                  trimExpandedText: AppStrings.spaceSign + AppStrings.spaceSign + AppStrings.showLessText,
                  style: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 16,
                  ),
                  lessStyle: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 10,
                  ),
                  moreStyle: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
