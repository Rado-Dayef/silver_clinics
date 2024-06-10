import 'package:silver_clinics/constants/app_imports.dart';

class AnalysisLabPreparationsNecessaryForTheTestsModel {
  final String title;
  final List body;

  const AnalysisLabPreparationsNecessaryForTheTestsModel(
    this.title, {
    required this.body,
  });

  factory AnalysisLabPreparationsNecessaryForTheTestsModel.fromJson(Map<String, dynamic> json) {
    return AnalysisLabPreparationsNecessaryForTheTestsModel(
      json[AppStrings.titleField] ?? AppStrings.emptySign,
      body: json[AppStrings.bodyField] ?? [],
    );
  }
}
