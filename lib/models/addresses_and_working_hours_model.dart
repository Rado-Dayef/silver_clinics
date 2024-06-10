import 'package:silver_clinics/constants/app_imports.dart';

class AddressesAndWorkingHoursModel {
  Map workingHours;
  final String title;
  final String email;
  final String address;
  final String location;
  final String phoneNumber;

  AddressesAndWorkingHoursModel(
    this.title, {
    required this.email,
    required this.address,
    required this.location,
    required this.phoneNumber,
    required this.workingHours,
  }) {
    List<String> orderedDays = [
      AppStrings.saturdayField,
      AppStrings.sundayField,
      AppStrings.mondayField,
      AppStrings.tuesdayField,
      AppStrings.wednesdayField,
      AppStrings.thursdayField,
      AppStrings.fridayField,
    ];
    Map<String, List<String>> orderedWorkingDays = {for (String day in orderedDays) day: workingHours[day]!};
    workingHours = orderedWorkingDays;
  }

  factory AddressesAndWorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return AddressesAndWorkingHoursModel(
      json[AppStrings.titleField] ?? AppStrings.emptySign,
      email: json[AppStrings.emailField] ?? AppStrings.emptySign,
      address: json[AppStrings.addressField] ?? AppStrings.emptySign,
      location: json[AppStrings.locationField] ?? AppStrings.emptySign,
      phoneNumber: json[AppStrings.phoneNumberField] ?? AppStrings.emptySign,
      workingHours: (json[AppStrings.workingHoursField] as Map<String, dynamic>).map(
        (String key, dynamic value) => MapEntry(
          key,
          List<String>.from(value),
        ),
      ),
    );
  }
}
