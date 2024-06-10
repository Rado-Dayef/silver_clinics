import 'package:silver_clinics/constants/app_imports.dart';

class DoctorsModel {
  final List days;
  final String name;
  final String image;
  final String clinic;
  final String specialty;

  const DoctorsModel(
    this.image, {
    required this.name,
    required this.days,
    required this.clinic,
    required this.specialty,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      json[AppStrings.imageField] ?? AppStrings.emptySign,
      name: json[AppStrings.nameField] ?? AppStrings.emptySign,
      days: json[AppStrings.daysField] ?? [],
      clinic: json[AppStrings.clinicField] ?? AppStrings.emptySign,
      specialty: json[AppStrings.specialtyField] ?? AppStrings.emptySign,
    );
  }
}
