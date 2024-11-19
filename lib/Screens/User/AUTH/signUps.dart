import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

class SignUPS extends StatefulWidget {
  const SignUPS({super.key});

  @override
  State<SignUPS> createState() => _SignUPSState();
}

class _SignUPSState extends State<SignUPS> {
  AuthController authcontroller = Get.put(AuthController());
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  String? passwordError;
  List<Map<String, dynamic>> networksList = [];
  ///////validate password
  String? validatePassword(String password) {
    String pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);

    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (!regExp.hasMatch(password)) {
      return 'Password must be at least 8 characters long,\ncontain uppercase, lowercase,\ndigit, and special character.';
    }
    return null; // No error if validation passes
  }

  @override
  void initState() {
    authcontroller.usersuscribtiondataAPI();
    // setState(() {
    //   authcontroller.selectedSuscribtionCardIndex.value = 1000000000;
    //   // authcontroller.selectedSuscribtionData.value = {};
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => authcontroller.suscribtiondataLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: Kform_border_twg,
              ),
            )
          : SlidingSheet(
              elevation: 2,
              cornerRadius: 20,
              snapSpec: const SnapSpec(
                initialSnap: 0.8,
                snap: true,
                snappings: [0.5, 0.8, 1.0],
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
                            "Sign Up",
                            style: GoogleFonts.poppins(
                                color: Kwhite,
                                fontSize: 32.sp,
                                fontWeight: kFW600),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            "We are glad to see you here",
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
                          //  Get.toNamed(kSearchPlaces);
                        },
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "First Name",
                        maxLines: 1,
                        readOnly: false,
                        label: "First Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter First Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces);
                        },
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Last Name",
                        maxLines: 1,
                        readOnly: false,
                        label: "Last Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Last Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces);
                        },
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Email",
                        maxLines: 1,
                        readOnly: false,
                        label: "Email",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFormFields(
                        ontap: () {},
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Mobile Number",
                        maxLines: 1,
                        readOnly: false,
                        label: "Mobile Number",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Mobile Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      /////////////
                      ///#D2D6DE
                      /////////////
                      Text(
                        "Password",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            //  letterSpacing: 1,
                            color: KBlack_twg,
                            fontWeight: kFW400),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Kwhite,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Kform_border_twg,
                              obscureText: passwordVisible,
                              obscuringCharacter: '*',
                              enabled: true,
                              readOnly: false,
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: kFW500,
                                color: kblack,
                              ),
                              decoration: InputDecoration(
                                fillColor: Kwhite,
                                focusColor: Kwhite,
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: passwordError == null
                                          ? KText_border_twg
                                          : KRed_twg,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: KRed_twg, width: 0.5),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: passwordError == null
                                          ? Kform_border_twg
                                          : KRed_twg,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                hintText: "Enter Password",
                                alignLabelWithHint: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20.sp,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                hintStyle: GoogleFonts.poppins(
                                  color: KLighText_twg,
                                  fontSize: 14.sp,
                                  fontWeight: kFW400,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  passwordError = validatePassword(value);
                                });
                              },
                            ),
                            if (passwordError != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  passwordError!,
                                  style: TextStyle(
                                      color: KRed_twg, fontSize: 12.sp),
                                ),
                              ),
                          ],
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: Kwhite,
                      //   ),
                      //   child: TextFormField(
                      //     cursorColor: Kform_border_twg,
                      //     obscureText: passwordVisible,
                      //     obscuringCharacter: '*',
                      //     enabled: true,
                      //     readOnly: false,
                      //     style: GoogleFonts.poppins(
                      //         fontSize: 14.sp, fontWeight: kFW500, color: kblack),
                      //     decoration: InputDecoration(
                      //       focusColor: Kwhite,
                      //       filled: true,
                      //       floatingLabelBehavior: FloatingLabelBehavior.auto,
                      //       contentPadding: const EdgeInsets.symmetric(
                      //           vertical: 16, horizontal: 8),

                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(50.r),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: KText_border_twg, width: 0.5),
                      //         borderRadius: BorderRadius.circular(8.r),
                      //       ),
                      //       errorBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: KRed_twg, width: 0.5),
                      //         borderRadius: BorderRadius.circular(8.r),
                      //       ),
                      //       disabledBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: KText_border_twg, width: 0.5),
                      //         borderRadius: BorderRadius.circular(8.r),
                      //       ),
                      //       focusedErrorBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: Kform_border_twg, width: 1),
                      //         borderRadius: BorderRadius.circular(8.r),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: Kform_border_twg, width: 1),
                      //         borderRadius: BorderRadius.circular(8.r),
                      //       ),
                      //       fillColor: Kwhite,

                      //       hintText: "Enter Password",
                      //       alignLabelWithHint: true,
                      //       suffixIcon: IconButton(
                      //         icon: Icon(
                      //           passwordVisible
                      //               ? Icons.visibility
                      //               : Icons.visibility_off,
                      //           size: 20.sp,
                      //         ),
                      //         onPressed: () {
                      //           setState(
                      //             () {
                      //               passwordVisible = !passwordVisible;
                      //             },
                      //           );
                      //         },
                      //       ),
                      //       //make hint text
                      //       hintStyle: GoogleFonts.poppins(
                      //         color: KLighText_twg,
                      //         fontSize: 14.sp,
                      //         fontWeight: kFW400,
                      //       ),
                      //       //////////////////

                      //       ////////////

                      //       //create lable
                      //     ),
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Please enter Password';
                      //       }
                      //       return null;
                      //     },
                      //     onChanged: (value) {},
                      //   ),
                      // ),
                      SizedBox(
                        height: 15.h,
                      ),

                      /////////////
                      ///#D2D6DE
                      /////////////
                      Text(
                        "Confirm Password",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            //  letterSpacing: 1,
                            color: KBlack_twg,
                            fontWeight: kFW400),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Kwhite,
                        ),
                        child: TextFormField(
                          cursorColor: Kform_border_twg,
                          obscureText: confirmpasswordVisible,
                          obscuringCharacter: '*',
                          enabled: true,
                          readOnly: false,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: kFW500,
                              color: kblack),
                          decoration: InputDecoration(
                            focusColor: Kwhite,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: KText_border_twg, width: 0.5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: KRed_twg, width: 0.5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: KText_border_twg, width: 0.5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            fillColor: Kwhite,

                            hintText: "Enter Confirm Password",
                            alignLabelWithHint: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                confirmpasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20.sp,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    confirmpasswordVisible =
                                        !confirmpasswordVisible;
                                  },
                                );
                              },
                            ),
                            //make hint text
                            hintStyle: GoogleFonts.poppins(
                              color: KLighText_twg,
                              fontSize: 14.sp,
                              fontWeight: kFW400,
                            ),
                            //////////////////

                            ////////////

                            //create lable
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter ConfirmPassword';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Choose Your Plan",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            //  letterSpacing: 1,
                            color: KBlack_twg,
                            fontWeight: kFW400),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      //plans api
                      authcontroller.suscribtiondata.length == 0 ||
                              authcontroller.suscribtiondata == null
                          ? SizedBox()
                          : SizedBox(
                              height: MediaQuery.of(context).size.height / 8,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    authcontroller.suscribtiondata.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        authcontroller
                                            .selectedSuscribtionCardIndex
                                            .value = index;

                                        authcontroller
                                                .selectedSuscribtionData.value =
                                            authcontroller
                                                .suscribtiondata[index];
                                        authcontroller.selectedSuscribtionCardId
                                                .value =
                                            authcontroller
                                                .suscribtiondata[index]["id"];
                                        networksList = parseNetworksWithLength(
                                            authcontroller
                                                    .selectedSuscribtionData[
                                                "networks"]);
                                      });
                                      print("object");
                                    },
                                    child: Container(
                                      width: 130.w,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 10.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: authcontroller
                                                        .selectedSuscribtionCardIndex ==
                                                    index
                                                ? kblack
                                                : Colors.transparent,
                                            width: 5),
                                        borderRadius: BorderRadius.circular(4),
                                        boxShadow: [
                                          BoxShadow(
                                            color: kblack.withOpacity(0.5),
                                          ),
                                          BoxShadow(
                                            color: KGradient_Purple_one_twg,
                                            spreadRadius: -5,
                                            blurRadius: 2,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${authcontroller.suscribtiondata[index]["name"]} \n ₹ ${authcontroller.suscribtiondata[index]["price"]} - ${authcontroller.suscribtiondata[index]["subscription_expiration_days"]} Days",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontSize: kTwelveFont,
                                            //  letterSpacing: 1,
                                            color: Kwhite,
                                            fontWeight: kFW700),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      authcontroller.selectedSuscribtionData["name"] == null &&
                              authcontroller.selectedSuscribtionData["price"] ==
                                  null
                          // authcontroller.selectedSuscribtionData == {}
                          //authcontroller.selectedSuscribtionData == {}
                          ? SizedBox()
                          : Container(
                              padding: EdgeInsets.all(14),
                              margin: EdgeInsets.only(top: 20.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Kpurple_twg),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        authcontroller
                                            .selectedSuscribtionData["name"],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontSize: 24.sp,
                                            //  letterSpacing: 1,
                                            color: Kwhite,
                                            fontWeight: kFW600),
                                      ),
                                      Stack(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/pink_banner_svgs.svg', // Use your SVG file path
                                            width: 90.w, // Specify width
                                            height: 36.h, // Specify height
                                            fit: BoxFit
                                                .fitHeight, // Specify fit type
                                          ),
                                          Positioned(
                                            // top: 2,
                                            bottom: 7.h,
                                            left: 0,
                                            right: 0,
                                            child: Center(
                                              child: Text(
                                                "₹ ${authcontroller.selectedSuscribtionData["price"]}\-",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: kFourteenFont,
                                                    //  letterSpacing: 1,
                                                    color: Kwhite,
                                                    fontWeight: kFW700),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  RichText(
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: "Next Renewal Due  ",
                                      style: GoogleFonts.poppins(
                                          fontSize: kTwelveFont,
                                          //  letterSpacing: 1,
                                          color: Kwhite,
                                          fontWeight: kFW500),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              DateFormat("MMM dd, yyyy").format(
                                            DateTime.now().add(
                                              Duration(
                                                days: int.parse(
                                                  authcontroller
                                                          .selectedSuscribtionData[
                                                      "subscription_expiration_days"],
                                                ),
                                              ),
                                            ),
                                          ),
                                          style: GoogleFonts.poppins(
                                              fontSize: kFourteenFont,
                                              //  letterSpacing: 1,
                                              color: Kwhite,
                                              fontWeight: kFW500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Allowed Networks",
                                    style: GoogleFonts.poppins(
                                        fontSize: kFourteenFont,
                                        //  letterSpacing: 1,
                                        color: Kwhite,
                                        fontWeight: kFW700),
                                  ),
                                  Divider(
                                    color: Kwhite,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 12,
                                    runSpacing: 8,
                                    children: networksList.map((networkData) {
                                      String network = networkData['name'];
                                      String count =
                                          networkData['length'].toString();

                                      return Stack(
                                        children: [
                                          Container(
                                            height: 42,
                                            width: 52,
                                            margin: EdgeInsets.only(
                                                top: 12, right: 12),
                                            decoration: BoxDecoration(
                                              color: Kwhite,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Image.asset(
                                              network == "facebook"
                                                  ? "assets/images/fb_logo.png"
                                                  : network == "twitter"
                                                      ? "assets/images/x_logo.png"
                                                      : network == "linkedin"
                                                          ? "assets/images/in_logo.png"
                                                          : network == "tumblr"
                                                              ? "assets/images/tumbler_logo.png"
                                                              : network ==
                                                                      "pinterest"
                                                                  ? "assets/images/pin_logo.png"
                                                                  : network ==
                                                                          "gmb"
                                                                      ? "assets/images/google_logo.png"
                                                                      : network ==
                                                                              "instagram"
                                                                          ? "assets/images/insta_logo.png"
                                                                          : network == "wordpress"
                                                                              ? "assets/images/word_logo.png"
                                                                              : network == "youtube"
                                                                                  ? "assets/images/y-tube_logo.png"
                                                                                  : "assets/images/${network}_images.png",
                                              height: 25,
                                              width: 25,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: CircleAvatar(
                                              backgroundColor: network ==
                                                      "facebook"
                                                  ? Kblue_twg
                                                  : network == "twitter"
                                                      ? kblack
                                                      : network == "linkedin"
                                                          ? Klinkedin_blue_twg
                                                          : network == "tumblr"
                                                              ? kblack
                                                              : network ==
                                                                      "pinterest"
                                                                  ? KPinterestred_twg
                                                                  : network ==
                                                                          "gmb"
                                                                      ? Kgoogledark_green_twg
                                                                      : network ==
                                                                              "instagram"
                                                                          ? KInsta_orange_twg
                                                                          : network == "wordpress"
                                                                              ? kblack
                                                                              : network == "youtube"
                                                                                  ? Kyou_tube_red
                                                                                  : kblack,
                                              radius: 12,
                                              child: Text(
                                                count,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Kwhite,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  )
                                  // Wrap(
                                  //   alignment: WrapAlignment.center,
                                  //   spacing: 12,
                                  //   runSpacing: 8,
                                  //   children: List.generate(11, (index) {
                                  //     return Stack(
                                  //       children: [
                                  //         Container(
                                  //           height: 42.h,
                                  //           width: 52.w,
                                  //           margin: EdgeInsets.only(
                                  //               top: 12.h, right: 12.w),
                                  //           decoration: BoxDecoration(
                                  //               color: Kwhite,
                                  //               border: Border.all(
                                  //                   color: KBlack_twg),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(4)),
                                  //           child: Image.asset(
                                  //             "assets/images/fb_image.png",
                                  //             height: 25.h,
                                  //             width: 25.w,
                                  //             // fit: BoxFit.cover,
                                  //           ),
                                  //         ),
                                  //         Positioned(
                                  //           top: 0,
                                  //           right: 0,
                                  //           child: CircleAvatar(
                                  //             backgroundColor: kblack,
                                  //             radius: 12,
                                  //             child: Text(
                                  //               "6",
                                  //               style: GoogleFonts.poppins(
                                  //                   fontSize: kTenFont,
                                  //                   //  letterSpacing: 1,
                                  //                   color: Kwhite,
                                  //                   fontWeight: kFW400),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     );
                                  //   }),
                                  // ),
                                ],
                              ),
                            ),
                      ///////////////////////////
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Apply coupon",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            color: KBlack_twg,
                            fontWeight: kFW400),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Kwhite,
                            border: Border.all(
                              color: Kblue_twg,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    color: KBlack_twg,
                                    fontWeight: kFW500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your Coupon",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: kFourteenFont,
                                      color: KText_border_twg,
                                      fontWeight: kFW400),
                                ),
                              ),
                            ),
                            CustomButton(
                                borderRadius: BorderRadius.circular(4.r),
                                Color: Kblue_twg,
                                textColor: Kwhite,
                                height: 42,
                                width: 120.w,
                                label: "Apply coupon",
                                fontSize: kFourteenFont,
                                fontWeight: kFW600,
                                isLoading: false,
                                onTap: () {
                                  // Get.back();
                                }),
                            // CustomButton(
                            //     label: "Apply coupon", isLoading: false, onTap: () {})
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Choose Payment method",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            //  letterSpacing: 1,
                            color: KBlack_twg,
                            fontWeight: kFW400),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),

                      Row(
                        children: [
                          Radio<String>(
                            value: 'Option 1',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption =
                                    value; // Update selected option
                              });
                            },
                          ),
                          Text(
                            "Razor Pay",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize: kFourteenFont,
                                //  letterSpacing: 1,
                                color: KBlack_twg,
                                fontWeight: kFW600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Kwhite,
                            border: Border.all(
                              color: KBlack_twg,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              height: 48.h,
                              decoration: BoxDecoration(
                                  color: KDarkblue_twg,
                                  border: Border.all(
                                    color: KBlack_twg,
                                  ),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                "Billing Details",
                                style: GoogleFonts.poppins(
                                    fontSize: kSixteenFont,
                                    //  letterSpacing: 1,
                                    color: Kwhite,
                                    fontWeight: kFW500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: CustomFormFields(
                                          ontap: () {
                                            //  Get.toNamed(kSearchPlaces);
                                          },
                                          enabled: true,
                                          labelColor: KText,
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter Address Line 1",
                                          maxLines: 1,
                                          readOnly: false,
                                          label: "Address Line 1",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Address Line 1';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: CustomFormFields(
                                          ontap: () {
                                            //  Get.toNamed(kSearchPlaces);
                                          },
                                          enabled: true,
                                          labelColor: KText,
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter Address Line 2",
                                          maxLines: 1,
                                          readOnly: false,
                                          label: "Address Line 2",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Address Line 2';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: CustomFormFields(
                                          ontap: () {
                                            //  Get.toNamed(kSearchPlaces);
                                          },
                                          enabled: true,
                                          labelColor: KText,
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "City",
                                          maxLines: 1,
                                          readOnly: false,
                                          label: "City",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter City';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: CustomFormFields(
                                          ontap: () {
                                            //  Get.toNamed(kSearchPlaces);
                                          },
                                          enabled: true,
                                          labelColor: KText,
                                          obscureText: false,
                                          keyboardType: TextInputType.number,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Postel Code",
                                          maxLines: 1,
                                          readOnly: false,
                                          label: "Postel Code",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Postel Code';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: CustomFormFields(
                                          ontap: () {},
                                          enabled: true,
                                          labelColor: KText,
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter State",
                                          maxLines: 1,
                                          readOnly: false,
                                          label: "State",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter State';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: CustomFormFields(
                                          ontap: () {
                                            //  Get.toNamed(kSearchPlaces);
                                          },
                                          enabled: true,
                                          labelColor: KText,
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter Country",
                                          maxLines: 1,
                                          readOnly: false,
                                          label: "Country",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Country';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //////////////
                      CustomButton(
                          margin: EdgeInsets.only(top: 36.h),
                          borderRadius: BorderRadius.circular(8.r),
                          Color: Kform_border_twg,
                          textColor: Kwhite,
                          height: 40,
                          width: double.infinity,
                          label: "Register",
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
                              text: "Already have an account?  ",
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
                      SizedBox(
                        height: 100.h,
                      )
                    ],
                  ),
                );
              },
            ),
    ));
  }

  List<Map<String, dynamic>> parseNetworksWithLength(String serializedData) {
    List<Map<String, dynamic>> networksList = [];
    RegExp regExp = RegExp(r's:(\d+):"(.*?)"'); // Capture length and name
    Iterable<RegExpMatch> matches = regExp.allMatches(serializedData);

    for (var match in matches) {
      int length = int.parse(match.group(1) ?? "0"); // Extract length as int
      String name = match.group(2) ?? "";
      networksList.add({'name': name, 'length': length});
    }

    return networksList;
  }
}
