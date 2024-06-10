import 'package:silver_clinics/constants/app_imports.dart';

class AnalysisLabBookingsModel {
  final String age;
  final String name;
  final String email;
  final String gender;
  final String phoneNumber;
  final String bookingPlace;
  final String offerAndDiscount;
  final String medicationsTakenByThePatient;

  AnalysisLabBookingsModel(
    this.name, {
    required this.age,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    required this.bookingPlace,
    required this.offerAndDiscount,
    required this.medicationsTakenByThePatient,
  });

  Map<String, dynamic> toJson() {
    return {
      AppStrings.ageField: age,
      AppStrings.nameField: name,
      AppStrings.emailField: email,
      AppStrings.genderField: gender,
      AppStrings.phoneNumberField: phoneNumber,
      AppStrings.bookingPlaceField: bookingPlace,
      AppStrings.offerAndDiscountField: offerAndDiscount,
      AppStrings.medicationsTakenByThePatientField: medicationsTakenByThePatient,
    };
  }
}
