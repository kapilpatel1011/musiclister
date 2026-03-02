import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_constants.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.audio_file, size: 50.sp,color: AppConstants.primaryWhiteColor,),
              Text(
                "Music Lister",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: AppConstants.primaryWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
