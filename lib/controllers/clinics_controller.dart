import 'package:silver_clinics/constants/app_imports.dart';

class ClinicsController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxString age = RxString(AppStrings.emptySign);
  RxString name = RxString(AppStrings.emptySign);
  RxString email = RxString(AppStrings.emptySign);
  RxString gender = RxString(AppStrings.emptySign);
  RxString clinic = RxString(AppStrings.emptySign);
  RxString bookingTime = RxString(AppStrings.emptySign);
  RxString phoneNumber = RxString(AppStrings.emptySign);
  RxList<ClinicsModel> clinicsList = RxList<ClinicsModel>();
  RxString offerAndDiscount = RxString(AppStrings.emptySign);
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  RxBool yourReservationHasBeenCompletedSuccessfully = RxBool(false);
  RxList<String> clinicWorkingHoursList = RxList<String>();
  RxString medicationsTakenByThePatient = RxString(AppStrings.emptySign);
  RxList<OffersAndDiscountsModel> offersAndDiscountsList = RxList<OffersAndDiscountsModel>();
  List<String> genderList = [
    AppStrings.maleText,
    AppStrings.femaleText,
  ];

  @override
  void onInit() {
    super.onInit();
    fetchClinicsData();
    fetchOffersAndDiscountsData();
  }

  /// To upload a new clinic booking to clinicBookings collection.
  void uploadClinicBooking() async {
    var formData = formStateKey.currentState;
    if (formData!.validate()) {
      formData.save();
      if (phoneNumber.value.length < 6) {
        AppDefaults.defaultToast(AppStrings.phoneNumberCanNotBeEmptyToast);
      } else {
        try {
          isLoading.value = true;
          CollectionReference bookings = FirebaseFirestore.instance.collection(AppStrings.clinicBookingsCollection);
          ClinicBookingsModel newAnalysisLabBookings = ClinicBookingsModel(
            name.value,
            age: age.value,
            email: email.value,
            gender: gender.value,
            clinic: clinic.value,
            phoneNumber: phoneNumber.value,
            bookingTime: bookingTime.value,
            offerAndDiscount: offerAndDiscount.value,
            medicationsTakenByThePatient: medicationsTakenByThePatient.value,
          );
          await bookings.add(newAnalysisLabBookings.toJson());
          isLoading.value = false;
          formStateKey.currentState!.reset();
          age.value = AppStrings.emptySign;
          name.value = AppStrings.emptySign;
          email.value = AppStrings.emptySign;
          gender.value = AppStrings.emptySign;
          clinic.value = AppStrings.emptySign;
          bookingTime.value = AppStrings.emptySign;
          phoneNumber.value = AppStrings.emptySign;
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

  /// To fetch the clinics offers and discounts from firebase.
  void fetchOffersAndDiscountsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(AppStrings.offersAndDiscountsCollection).where(AppStrings.isLabField, isEqualTo: false).get();
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

  /// To fetch the clinics from firebase.
  void fetchClinicsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(AppStrings.clinicsCollection).get();
      var dataList = snapshot.docs.map(
        (doc) {
          return ClinicsModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      clinicsList.value = dataList;
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingDataToast + AppStrings.colonSign + AppStrings.spaceSign + e.toString());
    }
  }
}
