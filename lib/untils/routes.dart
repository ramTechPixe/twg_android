// import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:twg/untils/constants.dart';
import 'package:twg/untils/export_file.dart';

class Routes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: kSplash,
        transition: Transition.rightToLeft,
        page: () => SplashScreen()),
    GetPage(
        name: kOnboarding,
        transition: Transition.rightToLeft,
        page: () => OnboardingScreen()),
    GetPage(
        name: kSignUps,
        transition: Transition.rightToLeft,
        page: () => SignUPS()),
    GetPage(
        name: kSignIns,
        transition: Transition.rightToLeft,
        page: () => SignIn()),
    GetPage(
        name: kForgotPassword,
        transition: Transition.rightToLeft,
        page: () => Forgotpassword()),
    GetPage(
        name: kNavigation,
        transition: Transition.rightToLeft,
        page: () => Bottom_navigation()),
    GetPage(
        name: kQuick_posting,
        transition: Transition.rightToLeft,
        page: () => QuickPosting()),
    GetPage(
        name: kEdit_Profile,
        transition: Transition.rightToLeft,
        page: () => EditProfile()),
    GetPage(
        name: kPublishedScreens,
        transition: Transition.rightToLeft,
        page: () => PublishedScreens()),
    GetPage(
        name: kSettingsScreens,
        transition: Transition.rightToLeft,
        page: () => SettingsScreen()),
    GetPage(
        name: kScheduledPostScreens,
        transition: Transition.rightToLeft,
        page: () => Schedule_post_view()),
    GetPage(
        name: kCreateBannersScreens,
        transition: Transition.rightToLeft,
        page: () => CustomizeBanners()),
  ];
}
