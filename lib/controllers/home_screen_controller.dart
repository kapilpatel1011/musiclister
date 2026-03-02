import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/song_model.dart';

class HomeScreenController extends GetxController {
  final storage = GetStorage();
  var savedSongs = <SongModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSongs();
  }

  void loadSongs() {
    List? storedSongs = storage.read<List>('playlist_data');
    if (storedSongs != null) {
      savedSongs.value = storedSongs.map((e) => SongModel.fromJson(e)).toList();
    }
  }

  Future<void> launchSongLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
            enableDomStorage: true,
          ),
        );

      } else {
        Get.snackbar("Error", "Could not launch the song link");
      }
    } catch (e) {
      Get.snackbar("Error", "Invalid URL format");
    }
  }

  void deleteSong(int index) {
    savedSongs.removeAt(index);
    storage.write('playlist_data', savedSongs.map((e) => e.toJson()).toList());
    Get.snackbar(
      "Success",
      "Song removed from playlist",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
