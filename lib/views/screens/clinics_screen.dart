import 'package:silver_clinics/constants/app_imports.dart';

class ClinicsScreen extends GetWidget<ClinicsController> {
  const ClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            AppStrings.offersAndDiscountsText,
            style: AppFonts.boldWhite20,
          ),
          const GapWidget(10),
          Obx(
            () {
              return controller.offersAndDiscountsList.isEmpty
                  ? const CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : CarouselSlider.builder(
                      itemCount: controller.offersAndDiscountsList.length,
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
                        OffersAndDiscountsModel offerAndDiscount = controller.offersAndDiscountsList[index];
                        return OffersAndDiscountsItemWidget(offerAndDiscount);
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
            AppStrings.clinicsText,
            style: AppFonts.boldWhite20,
          ),
          const GapWidget(10),
          Obx(
            () {
              return controller.clinicsList.isEmpty
                  ? const CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.clinicsList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 100,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        ClinicsModel clinic = controller.clinicsList[index];
                        return InkWell(
                          onTap: () => Get.toNamed(AppStrings.clinicDetailsRoute, arguments: clinic),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              clinic.title,
                              textAlign: TextAlign.center,
                              style: AppFonts.boldNavyBlue20,
                            ),
                          ),
                        );
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
            AppStrings.bookingText,
            style: AppFonts.boldWhite20,
          ),
          const GapWidget(10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formStateKey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    onSaved: (String? value) {
                      controller.name.value = value!;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.emptyValidation;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    labelName: AppStrings.nameText,
                  ),
                  const GapWidget(10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldWidget(
                          onSaved: (String? value) {
                            controller.age.value = value!;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.emptyValidation;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          labelName: AppStrings.ageText,
                        ),
                      ),
                      const GapWidget(10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.white,
                            ),
                          ),
                          child: Obx(
                            () {
                              return Align(
                                alignment: Alignment.topCenter,
                                child: DropdownButton<String>(
                                  underline: const Divider(
                                    color: AppColors.transparent,
                                  ),
                                  isExpanded: true,
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor: AppColors.white,
                                  iconEnabledColor: AppColors.white,
                                  iconDisabledColor: AppColors.white,
                                  alignment: Alignment.centerRight,
                                  items: controller.genderList.map(
                                    (String genderOption) {
                                      return DropdownMenuItem<String>(
                                        value: genderOption,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            genderOption,
                                            style: AppFonts.normalNavyBlue20,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String? newValue) {
                                    controller.gender.value = newValue ?? AppStrings.emptySign;
                                  },
                                  hint: Text(
                                    controller.gender.value.isEmpty ? AppStrings.genderText : controller.gender.value,
                                    style: AppFonts.normalWhite20,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const GapWidget(10),
                  IntlPhoneField(
                    onChanged: (PhoneNumber value) {
                      controller.phoneNumber.value = value.completeNumber;
                    },
                    countries: countries
                        .where(
                          (country) => country.name != AppStrings.shitText,
                        )
                        .toList(),
                    textAlign: TextAlign.right,
                    cursorColor: AppColors.white,
                    decoration: InputDecoration(
                      errorStyle: AppFonts.normalWhite20.copyWith(
                        fontSize: 10,
                      ),
                      labelStyle: AppFonts.normalWhite20,
                      labelText: AppStrings.phoneNumberText,
                      border: AppDefaults.defaultInputBorder(),
                      errorBorder: AppDefaults.defaultInputBorder(),
                      focusedBorder: AppDefaults.defaultInputBorder(),
                      enabledBorder: AppDefaults.defaultInputBorder(),
                      disabledBorder: AppDefaults.defaultInputBorder(),
                      focusedErrorBorder: AppDefaults.defaultInputBorder(),
                    ),
                    initialCountryCode: AppStrings.egyptCodeText,
                    style: AppFonts.normalWhite20,
                    dropdownTextStyle: AppFonts.normalWhite20,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: AppColors.navyBlue,
                      countryNameStyle: AppFonts.normalWhite20,
                      countryCodeStyle: AppFonts.normalWhite20,
                      searchFieldCursorColor: AppColors.white,
                      searchFieldInputDecoration: InputDecoration(
                        labelStyle: AppFonts.normalWhite20,
                        border: AppDefaults.defaultInputBorder(),
                        errorBorder: AppDefaults.defaultInputBorder(),
                        focusedBorder: AppDefaults.defaultInputBorder(),
                        enabledBorder: AppDefaults.defaultInputBorder(),
                        disabledBorder: AppDefaults.defaultInputBorder(),
                        focusedErrorBorder: AppDefaults.defaultInputBorder(),
                      ),
                    ),
                    languageCode: AppStrings.arabicCodeText,
                    onSaved: (PhoneNumber? newValue) {
                      controller.phoneNumber.value = newValue!.completeNumber;
                    },
                  ),
                  const GapWidget(10),
                  TextFormFieldWidget(
                    onSaved: (String? value) {
                      controller.email.value = value ?? AppStrings.emptySign;
                    },
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 5,
                    labelName: AppStrings.emailText,
                  ),
                  const GapWidget(10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                    child: Obx(
                      () {
                        return DropdownButton<String>(
                          underline: const Divider(
                            color: AppColors.transparent,
                          ),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: AppColors.white,
                          iconEnabledColor: AppColors.white,
                          iconDisabledColor: AppColors.white,
                          alignment: Alignment.centerRight,
                          items: controller.clinicsList.map(
                            (ClinicsModel clinic) {
                              return DropdownMenuItem<String>(
                                value: clinic.title,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    clinic.title,
                                    style: AppFonts.normalNavyBlue20,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (String? newValue) {
                            controller.clinic.value = newValue ?? AppStrings.emptySign;
                            ClinicsModel clinic = controller.clinicsList.where((clinic) => clinic.title == newValue).first;
                            controller.clinicWorkingHoursList.clear();
                            controller.bookingTime.value = AppStrings.emptySign;
                            clinic.workingHours[AppStrings.saturdayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.saturdayField].last != AppStrings.emptyHourSign
                                ? controller.clinicWorkingHoursList.add(AppStrings.saturdayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.saturdayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.saturdayField].last)
                                : null;
                            clinic.workingHours[AppStrings.sundayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.sundayField].last != AppStrings.emptyHourSign ? controller.clinicWorkingHoursList.add(AppStrings.sundayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.sundayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.sundayField].last) : null;
                            clinic.workingHours[AppStrings.mondayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.mondayField].last != AppStrings.emptyHourSign ? controller.clinicWorkingHoursList.add(AppStrings.mondayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.mondayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.mondayField].last) : null;
                            clinic.workingHours[AppStrings.tuesdayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.tuesdayField].last != AppStrings.emptyHourSign ? controller.clinicWorkingHoursList.add(AppStrings.tuesdayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.tuesdayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.tuesdayField].last) : null;
                            clinic.workingHours[AppStrings.wednesdayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.wednesdayField].last != AppStrings.emptyHourSign
                                ? controller.clinicWorkingHoursList.add(AppStrings.wednesdayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.wednesdayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.wednesdayField].last)
                                : null;
                            clinic.workingHours[AppStrings.thursdayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.thursdayField].last != AppStrings.emptyHourSign
                                ? controller.clinicWorkingHoursList.add(AppStrings.thursdayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.thursdayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.thursdayField].last)
                                : null;
                            clinic.workingHours[AppStrings.fridayField].first != AppStrings.emptyHourSign && clinic.workingHours[AppStrings.fridayField].last != AppStrings.emptyHourSign ? controller.clinicWorkingHoursList.add(AppStrings.fridayText + AppStrings.spaceSign + AppStrings.fromText + AppStrings.spaceSign + clinic.workingHours[AppStrings.fridayField].first + AppStrings.spaceSign + AppStrings.toText + AppStrings.spaceSign + clinic.workingHours[AppStrings.fridayField].last) : null;
                          },
                          hint: Text(
                            controller.clinic.value.isEmpty ? AppStrings.selectClinicText : controller.clinic.value,
                            style: AppFonts.normalWhite20,
                          ),
                        );
                      },
                    ),
                  ),
                  const GapWidget(10),
                  Obx(
                    () {
                      return controller.clinic.value.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.white,
                                ),
                              ),
                              child: Obx(
                                () {
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: DropdownButton<String>(
                                      underline: const Divider(
                                        color: AppColors.transparent,
                                      ),
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(10),
                                      dropdownColor: AppColors.white,
                                      iconEnabledColor: AppColors.white,
                                      iconDisabledColor: AppColors.white,
                                      alignment: Alignment.centerRight,
                                      items: controller.clinicWorkingHoursList.map(
                                        (String genderOption) {
                                          return DropdownMenuItem<String>(
                                            value: genderOption,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                genderOption,
                                                style: AppFonts.normalNavyBlue20,
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (String? newValue) {
                                        controller.bookingTime.value = newValue ?? AppStrings.emptySign;
                                      },
                                      hint: Text(
                                        controller.bookingTime.value.isEmpty ? AppStrings.selectBookingTimeText : controller.bookingTime.value,
                                        style: AppFonts.normalWhite20,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const GapWidget(0);
                    },
                  ),
                  const GapWidget(10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                    child: Obx(
                      () {
                        return DropdownButton<String>(
                          underline: const Divider(
                            color: AppColors.transparent,
                          ),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: AppColors.white,
                          iconEnabledColor: AppColors.white,
                          iconDisabledColor: AppColors.white,
                          alignment: Alignment.centerRight,
                          items: controller.offersAndDiscountsList.map(
                            (OffersAndDiscountsModel offerAndDiscount) {
                              return DropdownMenuItem<String>(
                                value: offerAndDiscount.title,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    offerAndDiscount.title,
                                    style: AppFonts.normalNavyBlue20,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (String? newValue) {
                            controller.offerAndDiscount.value = newValue ?? AppStrings.emptySign;
                          },
                          hint: Text(
                            controller.offerAndDiscount.value.isEmpty ? AppStrings.selectFromOffersAndDiscountsText : controller.offerAndDiscount.value,
                            style: AppFonts.normalWhite20,
                          ),
                        );
                      },
                    ),
                  ),
                  const GapWidget(10),
                  TextFormFieldWidget(
                    onSaved: (String? value) {
                      controller.medicationsTakenByThePatient.value = value ?? AppStrings.emptySign;
                    },
                    maxLines: 5,
                    minLines: 2,
                    keyboardType: TextInputType.text,
                    labelName: AppStrings.medicationsTakenByThePatientText,
                  ),
                  const GapWidget(10),
                  InkWell(
                    onTap: controller.uploadClinicBooking,
                    child: Obx(
                      () {
                        return AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 512,
                          ),
                          padding: const EdgeInsets.all(10),
                          height: controller.isLoading.value ? 50 : 50,
                          width: controller.isLoading.value ? 50 : 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: controller.isLoading.value ? AppColors.white : AppColors.navyBlue,
                            borderRadius: BorderRadius.circular(controller.isLoading.value ? 100 : 20),
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: AppColors.navyBlue,
                                )
                              : Text(
                                  AppStrings.sendText,
                                  style: AppFonts.boldWhite20.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () {
              return controller.yourReservationHasBeenCompletedSuccessfully.value
                  ? Text(
                      AppStrings.yourReservationHasBeenCompletedSuccessfullyText,
                      style: AppFonts.normalWhite20.copyWith(
                        fontSize: 18,
                      ),
                    )
                  : const GapWidget(0);
            },
          ),
          const GapWidget(10),
        ],
      ),
    );
  }
}
