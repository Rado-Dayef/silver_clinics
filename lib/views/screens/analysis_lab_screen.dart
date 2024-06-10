import 'package:silver_clinics/constants/app_imports.dart';

class AnalysisLabScreen extends GetWidget<AnalysisLabController> {
  const AnalysisLabScreen({super.key});

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
            AppStrings.preparationsNecessaryForTheTestsText,
            style: AppFonts.boldWhite20,
          ),
          const GapWidget(10),
          Obx(
            () {
              return controller.preparationsNecessaryForTheTestsList.isEmpty
                  ? const CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : CarouselSlider.builder(
                      itemCount: controller.offersAndDiscountsList.length,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        height: 200,
                        autoPlay: false,
                        viewportFraction: 0.8,
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
                        AnalysisLabPreparationsNecessaryForTheTestsModel preparationsNecessaryForTheTests = controller.preparationsNecessaryForTheTestsList[index];
                        return PreparationsNecessaryForTheTestsItemWidget(preparationsNecessaryForTheTests);
                      },
                    );
              // : ListView.separated(
              //     padding: const EdgeInsets.all(10),
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: controller.preparationsNecessaryForTheTestsList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       AnalysisLabPreparationsNecessaryForTheTestsModel preparationsNecessaryForTheTests = controller.preparationsNecessaryForTheTestsList[index];
              //       return PreparationsNecessaryForTheTestsItemWidget(preparationsNecessaryForTheTests);
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return const GapWidget(10);
              //     },
              //   );
            },
          ),
          const Divider(
            color: AppColors.white,
            height: 50,
            indent: 10,
            endIndent: 10,
          ),
          const Text(
            AppStrings.reservationsText,
            style: AppFonts.boldWhite20,
          ),
          const GapWidget(10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                BookingButtonWidget(
                  AppStrings.bookingVisitToHomeText,
                  onTapBool: true,
                  conditionBool: controller.bookingVisitToHomeIsOpened,
                ),
                const GapWidget(10),
                BookingButtonWidget(
                  AppStrings.bookingVisitToTheLabText,
                  onTapBool: false,
                  conditionBool: controller.bookingVisitToTheLabIsOpened,
                ),
              ],
            ),
          ),
          const GapWidget(10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(
              () {
                return controller.bookingVisitToHomeIsOpened.value || controller.bookingVisitToTheLabIsOpened.value
                    ? Form(
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
                            controller.bookingVisitToHomeIsOpened.value
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      AppStrings.pleaseNoteThatThereIsAFeeOf100PoundsForTheHomeVisitText,
                                      textAlign: TextAlign.center,
                                      style: AppFonts.normalWhite20.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                : const GapWidget(0),
                            InkWell(
                              onTap: controller.uploadAnalysisLabBooking,
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
                      )
                    : const GapWidget(0);
              },
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
        ],
      ),
    );
  }
}

/// Preparations necessary for the tests item widget.
class PreparationsNecessaryForTheTestsItemWidget extends StatelessWidget {
  final AnalysisLabPreparationsNecessaryForTheTestsModel preparationNecessaryForTheTest;

  const PreparationsNecessaryForTheTestsItemWidget(
    this.preparationNecessaryForTheTest, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              preparationNecessaryForTheTest.title,
              style: AppFonts.boldNavyBlue20.copyWith(
                fontSize: 18,
              ),
            ),
            const GapWidget(5),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: preparationNecessaryForTheTest.body.length,
              itemBuilder: (BuildContext context, int index) {
                String body = preparationNecessaryForTheTest.body[index];
                return Text(
                  AppStrings.doteSign + AppStrings.spaceSign + body,
                  style: AppFonts.normalNavyBlue20.copyWith(
                    fontSize: 16,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const GapWidget(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Booking button widget.
class BookingButtonWidget extends StatelessWidget {
  final String title;
  final bool onTapBool;
  final RxBool conditionBool;

  const BookingButtonWidget(
    this.title, {
    required this.onTapBool,
    required this.conditionBool,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AnalysisLabController analysisLabController = Get.find();
    return Expanded(
      child: InkWell(
        onTap: () {
          analysisLabController.toggleVisitType(onTapBool);
        },
        child: Obx(
          () {
            return AnimatedContainer(
              duration: const Duration(
                milliseconds: 512,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: conditionBool.value ? AppColors.white : AppColors.navyBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.boldWhite20.copyWith(
                    fontSize: 18,
                    color: conditionBool.value ? AppColors.navyBlue : AppColors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
