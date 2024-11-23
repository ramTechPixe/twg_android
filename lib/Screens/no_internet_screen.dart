import 'package:flutter/services.dart';
import 'package:twg/untils/export_file.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  void initState() {
    super.initState();
  }

  /////
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Kwhite,
        body: Container(
          margin: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/no_internet.png",
                height: 250.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "No Internet Connection",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: 22.sp, fontWeight: kFW600),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "No Internet Connection found, Check your Connection.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: 11.sp, fontWeight: kFW500),
              ),
              CustomButton(
                  margin: EdgeInsets.only(top: 80.h),
                  borderRadius: BorderRadius.circular(8.r),
                  Color: Kform_border_twg,
                  textColor: Kwhite,
                  height: 40,
                  width: double.infinity,
                  label: "Try Again",
                  fontSize: kSixteenFont,
                  fontWeight: kFW700,
                  isLoading: false,
                  onTap: () async {
                    bool isConnected =
                        await InternetConnection().hasInternetAccess;
                    if (isConnected == true) {
                      Get.back();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
