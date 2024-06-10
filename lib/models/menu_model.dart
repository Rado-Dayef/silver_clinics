import 'package:silver_clinics/constants/app_imports.dart';

class MenuModel {
  final Widget body;
  final String icon;
  final String title;

  const MenuModel(
    this.title, {
    required this.icon,
    required this.body,
  });
}
