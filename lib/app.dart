
import 'package:craftybay/controller_bainder.dart';
import 'package:craftybay/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.themeColor),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColors.themeColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
            ),
            fixedSize: const Size.fromWidth(double.maxFinite),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _outlineInputBorder(),
          focusedBorder: _outlineInputBorder(),
          enabledBorder: _outlineInputBorder(),
          errorBorder: _outlineInputBorder(Colors.red),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.themeColor,
            textStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor, width: 1.7),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
