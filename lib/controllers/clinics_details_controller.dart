import 'package:silver_clinics/constants/app_imports.dart';

class ClinicsDetailsController extends GetxController {
  ClinicsModel clinic = Get.arguments;
  RxList<DoctorsModel> doctorsList = RxList<DoctorsModel>();

  @override
  void onInit() {
    super.onInit();
    fetchDoctorsData();
  }

  /// To fetch the doctors from firebase.
  void fetchDoctorsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(AppStrings.clinicDoctorsCollection).where(AppStrings.clinicField, isEqualTo: clinic.title).get();
      var dataList = snapshot.docs.map(
        (doc) {
          return DoctorsModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      doctorsList.value = dataList;
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingDataToast + AppStrings.colonSign + AppStrings.spaceSign + e.toString());
    }
  }
}
