import 'package:get/get.dart';
import 'package:musiclister/views/playlist/create_playlist_screen.dart';

import '../splash/splash_screen.dart';
import '../views/home/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashscreen, page: () => SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.createplaylist, page: () => CreatePlaylistScreen()),

  ];

}
