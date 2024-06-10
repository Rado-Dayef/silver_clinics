import 'package:silver_clinics/constants/app_imports.dart';

class AddressesAndWorkingHoursController extends GetxController {
  RxList<AddressesAndWorkingHoursModel> addressesAndWorkingHoursList = RxList<AddressesAndWorkingHoursModel>();
  List<String> daysConditionalList = [
    AppStrings.saturdayField,
    AppStrings.sundayField,
    AppStrings.mondayField,
    AppStrings.tuesdayField,
    AppStrings.wednesdayField,
    AppStrings.thursdayField,
    AppStrings.fridayField,
  ];
  List<String> daysList = [
    AppStrings.saturdayText,
    AppStrings.sundayText,
    AppStrings.mondayText,
    AppStrings.tuesdayText,
    AppStrings.wednesdayText,
    AppStrings.thursdayText,
    AppStrings.fridayText,
  ];

  @override
  void onInit() {
    super.onInit();
    fetchAddressesAndWorkingHoursData();
  }

  /// To fetch the addresses and working hours from Firebase.
  void fetchAddressesAndWorkingHoursData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(AppStrings.addressesAndWorkingHoursCollection).get();
      var dataList = snapshot.docs.map(
        (doc) {
          return AddressesAndWorkingHoursModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      addressesAndWorkingHoursList.value = dataList;
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingDataToast + AppStrings.colonSign + AppStrings.spaceSign + e.toString());
    }
  }
}
