import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiclister/views/widgets/wg_button.dart';

import '../../controllers/home_screen_controller.dart';
import '../../controllers/playlist_controller.dart';
import '../../utils/app_constants.dart';

class CreatePlaylistScreen extends StatelessWidget {
  CreatePlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlaylistController());
    final homecontroller = Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Playlist",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.playListName,
                decoration: const InputDecoration(
                  labelText: "Playlist name",
                  prefixIcon: Icon(Icons.playlist_add),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Songs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "+ Add a new song",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),

              Obx(() {
                if (homecontroller.savedSongs.isEmpty) {
                  return const SizedBox();
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homecontroller.savedSongs.length,
                  itemBuilder: (context, index) {
                    final song = homecontroller.savedSongs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppConstants.secondaryTextColor,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.music_note_outlined,
                            color: AppConstants.primaryColor,
                            size: 30,
                          ),
                          title: Text(
                            song.songName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                          subtitle: Text(song.artist),
                          trailing: IconButton(
                            onPressed: () {
                              homecontroller.deleteSong(index);
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              size: 24.sp,
                              color: AppConstants.primaryRedColor,
                            ),
                          ),
                          onTap: () {
                            if (song.link.isNotEmpty) {
                              homecontroller.launchSongLink(song.link);
                            } else {
                              Get.snackbar(
                                "Notice",
                                "No link available for this song",
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                );
              }),

              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.songName,
                        decoration: const InputDecoration(
                          labelText: "Song name",
                          prefixIcon: Icon(Icons.music_note_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        controller: controller.artistName,
                        decoration: const InputDecoration(
                          labelText: "Song artist",
                          prefixIcon: Icon(Icons.person_2_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        controller: controller.link,
                        decoration: const InputDecoration(
                          labelText: "Song link",
                          prefixIcon: Icon(Icons.link),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      WgButton(
                        onTap: () {
                          controller.saveSong();
                        },
                        text: "Add Song To The Playlist",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),

    );
  }
}
