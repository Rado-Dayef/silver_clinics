import 'package:silver_clinics/constants/app_imports.dart';

class ClinicBookingsModel {
  final String age;
  final String name;
  final String email;
  final String gender;
  final String clinic;
  final String phoneNumber;
  final String bookingTime;
  final String offerAndDiscount;
  final String medicationsTakenByThePatient;

  ClinicBookingsModel(
    this.name, {
    required this.age,
    required this.email,
    required this.gender,
    required this.clinic,
    required this.phoneNumber,
    required this.bookingTime,
    required this.offerAndDiscount,
    required this.medicationsTakenByThePatient,
  });

  Map<String, dynamic> toJson() {
    return {
      AppStrings.ageField: age,
      AppStrings.nameField: name,
      AppStrings.emailField: email,
      AppStrings.genderField: gender,
      AppStrings.clinicField: clinic,
      AppStrings.phoneNumberField: phoneNumber,
      AppStrings.bookingTimeField: bookingTime,
      AppStrings.offerAndDiscountField: offerAndDiscount,
      AppStrings.medicationsTakenByThePatientField: medicationsTakenByThePatient,
    };
  }
}
