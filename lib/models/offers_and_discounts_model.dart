import 'package:silver_clinics/constants/app_imports.dart';

class OffersAndDiscountsModel {
  final bool isLab;
  final String body;
  final String image;
  final String title;

  const OffersAndDiscountsModel(
    this.image, {
    required this.body,
    required this.isLab,
    required this.title,
  });

  factory OffersAndDiscountsModel.fromJson(Map<String, dynamic> json) {
    return OffersAndDiscountsModel(
      json[AppStrings.imageField] ?? AppStrings.emptySign,
      body: json[AppStrings.bodyField] ?? AppStrings.emptySign,
      isLab: json[AppStrings.isLabField] ?? false,
      title: json[AppStrings.titleField] ?? AppStrings.emptySign,
    );
  }
}
