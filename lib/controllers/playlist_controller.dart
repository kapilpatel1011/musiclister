import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'home_screen_controller.dart';

class PlaylistController extends GetxController {
  final storage = GetStorage();
  final playListName = TextEditingController();
  final songName = TextEditingController();
  final artistName = TextEditingController();
  final link = TextEditingController();

  void saveSong() {
    if (songName.text.isEmpty || link.text.isEmpty) {
      Get.snackbar("Error", "Song name and link are required!");
      return;
    }

    Map<String, dynamic> newSong = {
      'playlistName': playListName.text.isEmpty
          ? "My Playlist"
          : playListName.text,
      'songName': songName.text,
      'artist': artistName.text,
      'link': link.text,
    };

    List allSongs = storage.read<List>('playlist_data') ?? [];
    allSongs.add(newSong);
    storage.write('playlist_data', allSongs);

    Get.find<HomeScreenController>().loadSongs();

    Get.back();
    Get.snackbar("Success", "Song added to playlist");
  }
}
