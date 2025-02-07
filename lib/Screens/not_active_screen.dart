import 'package:flutter/services.dart';
import 'package:twg/untils/export_file.dart';

class NoActive extends StatefulWidget {
  const NoActive({super.key});

  @override
  State<NoActive> createState() => _NoActiveState();
}

class _NoActiveState extends State<NoActive> {
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
                "assets/images/no_suscribe.png",
                height: 250.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "No Active Plan",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: 22.sp, fontWeight: kFW600),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Please Suscribe to Any plan",
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
                    Get.toNamed(kNavigation);
                    //  Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
