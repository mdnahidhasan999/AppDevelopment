import 'package:flutter/material.dart';
import 'package:practiceapp/ui/screens/auth/splash_screen.dart';
import 'package:practiceapp/ui/utility/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SplashScreen(), theme: LightThemeData());
  }

  ThemeData LightThemeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey,
          letterSpacing:0.4
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          padding: const EdgeInsets.symmetric(vertical: 18),
          foregroundColor: AppColors.whiteColor,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
