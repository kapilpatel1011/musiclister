import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiclister/routes/app_routes.dart';
import 'package:musiclister/utils/app_constants.dart';

import '../../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(title: const Text("My Playlists",style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Obx(() {
        if (controller.savedSongs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.audio_file, size: 30),
                SizedBox(height: 15.h),
                Text("No playlist added yet."),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.savedSongs.length,
          itemBuilder: (context, index) {
            final song = controller.savedSongs[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppConstants.primaryGreyColor),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.library_music,
                    color: AppConstants.primaryColor,
                    size: 30,
                  ),
                  title: Text(
                    song.playlistName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
                  ),
                  subtitle: Text("${song.artist} • ${song.playlistName}"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppConstants.primaryColor,
                  ),
                  onTap: () {},
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.primaryColor,
        onPressed: () => Get.toNamed(AppRoutes.createplaylist),
        child: const Icon(Icons.add, color: AppConstants.primaryWhiteColor),
      ),
    );
  }
}
