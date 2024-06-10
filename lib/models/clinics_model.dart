import 'package:silver_clinics/constants/app_imports.dart';

class ClinicsModel {
  final String title;
  final String about;
  final List specialties;
  final Map workingHours;

  const ClinicsModel(
    this.title, {
    required this.about,
    required this.specialties,
    required this.workingHours,
  });

  factory ClinicsModel.fromJson(Map<String, dynamic> json) {
    return ClinicsModel(
      json[AppStrings.titleField] ?? AppStrings.emptySign,
      about: json[AppStrings.aboutField] ?? AppStrings.emptySign,
      workingHours: json[AppStrings.workingHoursField] ?? {},
      specialties: json[AppStrings.specialtiesField] ?? {},
    );
  }
}
