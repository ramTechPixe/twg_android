import 'package:twg/untils/export_file.dart';

// class Forgotpassword extends StatefulWidget {
//   const Forgotpassword({super.key});

//   @override
//   State<Forgotpassword> createState() => _ForgotpasswordState();
// }

// class _ForgotpasswordState extends State<Forgotpassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 2,
        cornerRadius: 20,
        snapSpec: const SnapSpec(
          initialSnap: 0.79,
          snap: true,
          snappings: [0.79, 0.8],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                // margin: EdgeInsets.only(top: 160.h),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      KGradientPurple_twg,
                      KGradientPink_twg,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      "Reset Your Password",
                      style: GoogleFonts.poppins(
                          color: Kwhite, fontSize: 32.sp, fontWeight: kFW600),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "We are here to assist you",
                      style: GoogleFonts.poppins(
                          color: Kwhite,
                          fontSize: kTenFont,
                          fontWeight: kFW400),
                    ),
                  ],
                ),
                /////////////////////

                /////////////////
              ),
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            color: Kwhite,
            padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/horiz_divider.png",
                    height: 3.h,
                    width: 80.w,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),

                CustomFormFields(
                  ontap: () {
                    //  Get.toNamed(kSearchPlaces); // kForgotPassword
                  },
                  enabled: true,
                  labelColor: KText,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Email",
                  maxLines: 1,
                  readOnly: false,
                  label: "Enter your email to send reset password link",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),

                //////////////
                CustomButton(
                    margin: EdgeInsets.only(top: 36.h),
                    borderRadius: BorderRadius.circular(8.r),
                    Color: Kform_border_twg,
                    textColor: Kwhite,
                    height: 40,
                    width: double.infinity,
                    label: "Reset Password",
                    fontSize: kSixteenFont,
                    fontWeight: kFW700,
                    isLoading: false,
                    onTap: () {
                      // Get.back();
                    }),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(kSignIns);
                  },
                  child: Center(
                    child: RichText(
                      textScaleFactor: 1,
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "",
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: kFW400,
                          color: KBlack_twg,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Log In",
                            style: GoogleFonts.roboto(
                                fontSize: kSixteenFont,
                                color: Kform_border_twg,
                                fontWeight: kFW600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 2.5)
              ],
            ),
          );
        },
      ),
    );
  }
}
