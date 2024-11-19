import 'package:twg/untils/export_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {

  //   Future.delayed(const Duration(seconds: 3), () async {
  //     Get.toNamed(kOnboarding);
  //   });
  //   super.initState();
  // }
  /////////////////////////////////////////////
  bool? isUserLoggedIn;
  @override
  void initState() {
    super.initState();
/////////////////////////original code
    // isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    // Future.delayed(const Duration(seconds: 2), () async {
    //   if (isUserLoggedIn != null && isUserLoggedIn == true) {
    //     await apiController.getProfile();

    //     apiController.profileData["employeeType"] == "Donor"
    //         ? Get.toNamed(kDonorBottomNavigation)
    //         : Get.toNamed(kNavigation);
    //   } else {
    //     Get.toNamed(kMobileSignUp);
    //   }
    // });
    ////////////////////////////////////////////////////
    // isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    // Future.delayed(const Duration(seconds: 2), () async {
    //   await Get.toNamed(kNavigation);
    // });
    //////////////////////////////
    isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    Future.delayed(const Duration(seconds: 3), () async {
      if (isUserLoggedIn != null && isUserLoggedIn == true) {
        Get.toNamed(kNavigation);
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
