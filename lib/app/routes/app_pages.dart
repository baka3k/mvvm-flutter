import 'package:base_source/app/bindings/home_binding.dart';
import 'package:base_source/app/bindings/photolist_binding.dart';
import 'package:base_source/app/bindings/recipe_feeds_binding.dart';
import 'package:base_source/app/bindings/sign_in_binding.dart';
import 'package:base_source/app/bindings/splash_binding.dart';
import 'package:base_source/app/bindings/user_detail_binding.dart';
import 'package:base_source/app/feature/recipe_feed/views/recipe_feed_screen.dart';
import 'package:base_source/app/feature/map/views/map_screen.dart';
import 'package:base_source/app/feature/photo/views/photo_list_screen.dart';
import 'package:base_source/app/feature/signin/views/sign_in_screen.dart';
import 'package:base_source/app/feature/splash/views/splash_screen.dart';
import 'package:base_source/app/feature/user/views/home_screen.dart';
import 'package:base_source/app/feature/user/views/user_details_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => const UserDetailsScreen(),
      binding: UserDetailBinding(),
    ),
    GetPage(
      name: Routes.photoList,
      page: () => const PhotoListScreen(),
      binding: PhotoListBinding(),
    ),
    GetPage(
      name: Routes.map,
      page: () => MapScreen(),
      // binding: MapBinding(),
    ),
    GetPage(
      name: Routes.recipeFeed,
      page: () => const RecipeFeedScreen(),
      binding: RecipeFeedsBinding(),
    ),
  ];
}
