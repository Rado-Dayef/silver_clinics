import 'package:silver_clinics/constants/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
    );
    return GetMaterialApp(
      theme: ThemeData(
        hoverColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitleEnglish,
      initialBinding: AppBinding(),
      getPages: AppPages.getPages,
      initialRoute: AppStrings.homeRoute,
    );
  }
}
