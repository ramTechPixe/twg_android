import 'package:twg/untils/export_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProfileController userprofilecontroller = Get.put(ProfileController());
  /////////////////////////////////////////////
  bool? isUserLoggedIn;
  @override
  void initState() {
    super.initState();

    //////////////////////////////
    isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    Future.delayed(const Duration(seconds: 3), () async {
      if (isUserLoggedIn != null && isUserLoggedIn == true) {
        // Get.toNamed(kNavigation);
        userprofilecontroller.userProfileNavigation();
      } else {
        Get.toNamed(kOnboarding);
      }
    });
    /////////////////////////////
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Kwhite,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [KGradientPurple_twg, KGradientPink_twg, KLightPurple_twg],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/TWG_IMAGE.png",
          height: 115.h,
          width: 300.w,
        ),
      ),
    );
  }
}
