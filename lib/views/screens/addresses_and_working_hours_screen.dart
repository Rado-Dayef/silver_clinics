import 'package:silver_clinics/constants/app_imports.dart';

class AddressesAndWorkingHoursScreen extends GetWidget<AddressesAndWorkingHoursController> {
  const AddressesAndWorkingHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Obx(
            () {
              return controller.addressesAndWorkingHoursList.isEmpty
                  ? const CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.addressesAndWorkingHoursList.length,
                      itemBuilder: (BuildContext context, int index) {
                        AddressesAndWorkingHoursModel addressAndWorkingHours = controller.addressesAndWorkingHoursList[index];
                        return AddressesAndWorkingHoursItemWidget(
                          addressAndWorkingHours,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const GapWidget(10);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}

/// Address and working hours item widget.
class AddressesAndWorkingHoursItemWidget extends StatelessWidget {
  final AddressesAndWorkingHoursModel addressAndWorkingHours;

  const AddressesAndWorkingHoursItemWidget(this.addressAndWorkingHours, {super.key});

  @override
  Widget build(BuildContext context) {
    AddressesAndWorkingHoursController addressesAndWorkingHoursController = Get.find();
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            addressAndWorkingHours.title,
            style: AppFonts.boldNavyBlue20.copyWith(
              fontSize: 18,
            ),
          ),
          const GapWidget(10),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Icon(
                  Icons.location_on,
                  color: AppColors.navyBlue,
                  size: 20,
                ),
              ),
              const GapWidget(5),
              Expanded(
                flex: 95,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => launch(addressAndWorkingHours.location),
                    child: Text(
                      addressAndWorkingHours.address,
                      style: AppFonts.normalNavyBlue20.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const GapWidget(10),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Icon(
                  Icons.phone_android,
                  color: AppColors.navyBlue,
                  size: 20,
                ),
              ),
              const GapWidget(5),
              Expanded(
                flex: 95,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => launch(AppStrings.telText + AppStrings.colonSign + AppStrings.spaceSign + addressAndWorkingHours.phoneNumber),
                      child: Text(
                        addressAndWorkingHours.phoneNumber,
                        style: AppFonts.normalNavyBlue20.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const GapWidget(10),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Icon(
                  Icons.email,
                  color: AppColors.navyBlue,
                  size: 20,
                ),
              ),
              const GapWidget(5),
              Expanded(
                flex: 95,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => launch(AppStrings.mailtoText + AppStrings.colonSign + AppStrings.spaceSign + addressAndWorkingHours.email),
                    child: Text(
                      addressAndWorkingHours.email,
                      style: AppFonts.normalNavyBlue20.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const GapWidget(10),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    AppStrings.scoreSign,
                    style: AppFonts.boldNavyBlue20.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const GapWidget(5),
              Expanded(
                flex: 95,
                child: Text(
                  AppStrings.workingHoursText,
                  style: AppFonts.boldNavyBlue20.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const GapWidget(10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.navyBlue,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: AppColors.navyBlue,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          AppStrings.dayText,
                          style: AppFonts.boldWhite20.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            AppStrings.fromText,
                            style: AppFonts.boldWhite20.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            AppStrings.toText,
                            style: AppFonts.boldWhite20.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addressAndWorkingHours.workingHours.length,
                  itemBuilder: (BuildContext context, int index) {
                    String conditionalDay = addressesAndWorkingHoursController.daysConditionalList[index];
                    List workingHoursList = addressAndWorkingHours.workingHours[conditionalDay];
                    String day = addressesAndWorkingHoursController.daysList[index];
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              day,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.boldNavyBlue20.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          workingHoursList.first == AppStrings.emptyHourSign && workingHoursList.last == AppStrings.emptyHourSign
                              ? Expanded(
                                  flex: 6,
                                  child: Center(
                                    child: Text(
                                      AppStrings.closedText,
                                      style: AppFonts.boldWhite20.copyWith(
                                        color: AppColors.navyBlue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              : const GapWidget(0),
                          workingHoursList.first != AppStrings.emptyHourSign && workingHoursList.last != AppStrings.emptyHourSign
                              ? Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      workingHoursList.first,
                                      style: AppFonts.normalNavyBlue20.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              : const GapWidget(0),
                          workingHoursList.first != AppStrings.emptyHourSign && workingHoursList.last != AppStrings.emptyHourSign
                              ? Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      workingHoursList.last,
                                      style: AppFonts.normalNavyBlue20.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              : const GapWidget(0),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
