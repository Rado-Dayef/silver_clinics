import 'package:silver_clinics/constants/app_imports.dart';

class AnalysisLabController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxString age = RxString(AppStrings.emptySign);
  RxString name = RxString(AppStrings.emptySign);
  RxString email = RxString(AppStrings.emptySign);
  RxString gender = RxString(AppStrings.emptySign);
  RxBool bookingVisitToHomeIsOpened = RxBool(true);
  RxBool bookingVisitToTheLabIsOpened = RxBool(false);
  RxString phoneNumber = RxString(AppStrings.emptySign);
  RxString offerAndDiscount = RxString(AppStrings.emptySign);
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  RxBool yourReservationHasBeenCompletedSuccessfully = RxBool(false);
  RxString medicationsTakenByThePatient = RxString(AppStrings.emptySign);
  RxList<OffersAndDiscountsModel> offersAndDiscountsList = RxList<OffersAndDiscountsModel>();
  RxList<AnalysisLabPreparationsNecessaryForTheTestsModel> preparationsNecessaryForTheTestsList = RxList<AnalysisLabPreparationsNecessaryForTheTestsModel>();
  List<String> genderList = [
    AppStrings.maleText,
    AppStrings.femaleText,
  ];

  @override
  void onInit() {
    super.onInit();
    fetchOffersAndDiscountsData();
    fetchPreparationsNecessaryForTheTestsData();
  }

  /// To toggle visit type.
  void toggleVisitType(bool isHome) {
    if (isHome) {
      bookingVisitToHomeIsOpened.value = true;
      bookingVisitToTheLabIsOpened.value = false;
    } else {
      bookingVisitToHomeIsOpened.value = false;
      bookingVisitToTheLabIsOpened.value = true;
    }
  }

  /// To upload a new analysis lab bookings to analysisLabBookings collection.
  void uploadAnalysisLabBooking() async {
    var formData = formStateKey.currentState;
    if (formData!.validate()) {
      formData.save();
      if (phoneNumber.value.length < 6) {
        AppDefaults.defaultToast(AppStrings.phoneNumberCanNotBeEmptyToast);
      } else {
        try {
          isLoading.value = true;
          CollectionReference bookings = FirebaseFirestore.instance.collection(AppStrings.analysisLabBookingsCollection);
          AnalysisLabBookingsModel newAnalysisLabBookings = AnalysisLabBookingsModel(
            name.value,
            age: age.value,
            email: email.value,
            gender: gender.value,
            phoneNumber: phoneNumber.value,
            offerAndDiscount: offerAndDiscount.value,
            medicationsTakenByThePatient: medicationsTakenByThePatient.value,
            bookingPlace: bookingVisitToHomeIsOpened.value ? AppStrings.homeVisitText : AppStrings.visitToTheLabText,
          );
          await bookings.add(newAnalysisLabBookings.toJson());
          isLoading.value = false;
          age.value = AppStrings.emptySign;
          name.value = AppStrings.emptySign;
          email.value = AppStrings.emptySign;
          gender.value = AppStrings.emptySign;
          phoneNumber.value = AppStrings.emptySign;
          bookingVisitToHomeIsOpened.value = false;
          bookingVisitToTheLabIsOpened.value = false;
          offerAndDiscount.value = AppStrings.emptySign;
          medicationsTakenByThePatient.value = AppStrings.emptySign;
          AppDefaults.defaultToast(AppStrings.yourReservationHasBeenCompletedSuccessfullyToast);
          yourReservationHasBeenCompletedSuccessfully.value = true;
        } catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(AppStrings.errorFetchingDataToast + AppStrings.colonSign + AppStrings.spaceSign + e.toString());
        }
      }
    }
  }

  /// To fetch the analysis lab offers and discounts from firebase.
  void fetchOffersAndDiscountsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(AppStrings.offersAndDiscountsCollection).where(AppStrings.isLabField, isEqualTo: true).get();
      var dataList = snapshot.docs.map(
        (doc) {
          return OffersAndDiscountsModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      offersAndDiscountsList.value = dataList;
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingDataToast + AppStrings.colonSign + AppStrings.spaceSign + e.toString());
    }
  }

  /// To fetch the analysis lab preparations necessary for the tests from firebase.
  void fetchPreparationsNecessaryForTheTestsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(AppStrings.analysisLabPreparationsNecessaryForTheTestsCollection).get();
      var dataList = snapshot.docs.map(
        (doc) {
          return AnalysisLabPreparationsNecessaryForTheTestsModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      preparationsNecessaryForTheTestsList.value = dataList;
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingDataToast + AppStrings.colonSign + AppStrings.spaceSign + e.toString());
    }
  }
}
