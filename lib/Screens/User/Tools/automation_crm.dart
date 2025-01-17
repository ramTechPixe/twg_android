import 'package:twg/untils/export_file.dart';

class AutomationCRMScreen extends StatefulWidget {
  const AutomationCRMScreen({super.key});

  @override
  State<AutomationCRMScreen> createState() => _AutomationCRMScreenState();
}

class _AutomationCRMScreenState extends State<AutomationCRMScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  MenusController menuscontroller = Get.put(MenusController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  final List<String> CompanyList = [
    'Facebook Ads Lead Management',
    'Website Lead Management System'
  ];
  final _formKeyOne = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  @override
  void initState() {
    setState(() {
      dashboardcontroller.choosenAutoCRMTool.value =
          "Facebook Ads Lead Management";
      menuscontroller.fbleadname.text = "sri ram";
      menuscontroller.fbleademail.text = "sri965272@gmail.com";
      menuscontroller.fbleadPhone_number.text = "8686180840";
      menuscontroller.fbleadfacebook_page_link.text =
          "https://www.facebook.com/profile.php?id=61553474931502";
      menuscontroller.fbleadad_link.text =
          "https://ads.google.com/intl/en_us/home/";
      menuscontroller.fbladwebsite_link.text = "https://www.facebook.com/";
      //////

      // // ,
      /////
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: AppBar(
          elevation: 3,
          shadowColor: kblack,
          backgroundColor: Kblue_twg,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Kwhite,
              size: 23.sp,
            ),
          ),
          title: Text(
            "Automation CRM Tools",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: Obx(() => SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CRM Tools",
                    style: GoogleFonts.poppins(
                        color: Kform_border_twg,
                        fontSize: 22.sp,
                        fontWeight: kFW600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 1,
                      ),
                      color: Kwhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                    ),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2, bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Choose a Form",
                            style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: kSixteenFont,
                                fontWeight: kFW400),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Kwhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kblack.withOpacity(0.2),
                                    blurRadius: 2.r,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1.r,
                                  )
                                ]),
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Kform_border_twg, width: 1),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Kform_border_twg, width: 1),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: Text(
                                'Select Form',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: KTextgery.withOpacity(0.5),
                                ),
                              ),
                              items: CompanyList.map(
                                  (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select Form';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedUserValue = value.toString();

                                  dashboardcontroller.choosenAutoCRMTool.value =
                                      value.toString();

                                  setState(() {});
                                });
                              },
                              onSaved: (value) {
                                selectedUserValue = value.toString();
                                print(selectedUserValue);
                                setState(() {});
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kblack.withOpacity(0.6),
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    dashboardcontroller.choosenAutoCRMTool.value,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Kform_border_twg,
                        fontSize: 22.sp,
                        fontWeight: kFW600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg,
                              Klight_grey_twg
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 1,
                      ),
                      color: Kwhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                    ),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2, bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //
                          dashboardcontroller.choosenAutoCRMTool ==
                                  "Facebook Ads Lead Management"
                              ? Form(
                                  key: _formKeyOne,
                                  // autovalidateMode: AutovalidateMode.always,
                                  child: Column(
                                    children: [
                                      CustomFormFields(
                                        ontap: () {},
                                        controller: menuscontroller.fbleadname,
                                        enabled: true,
                                        labelColor: KText,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Name",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Name",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Name';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        labelColor: KText,
                                        controller: menuscontroller.fbleademail,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Mail ID",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Mail ID",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter mail';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        labelColor: KText,
                                        controller:
                                            menuscontroller.fbleadPhone_number,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Phone Number",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Phone Number",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Phone Number';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        labelColor: KText,
                                        controller: menuscontroller
                                            .fbleadfacebook_page_link,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Facebook Page Link",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Facebook Page Link",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Facebook Page Link';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        labelColor: KText,
                                        obscureText: false,
                                        controller:
                                            menuscontroller.fbleadad_link,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Ad Link",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Ad Link",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Ad Link';
                                          }
                                          return null;
                                        },
                                      ),
                                      Obx(
                                        () => menuscontroller.fbcrmLoading ==
                                                true
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Kform_border_twg,
                                                ),
                                              )
                                            : CustomButton(
                                                margin:
                                                    EdgeInsets.only(top: 36.h),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                Color: Kform_border_twg,
                                                textColor: Kwhite,
                                                height: 40,
                                                width: double.infinity,
                                                label: "Submit",
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW700,
                                                isLoading: false,
                                                onTap: () {
                                                  var payload = {
                                                    // "user_email": authcontroller
                                                    //     .UserEmailSignInController.text,
                                                    // "user_password": authcontroller
                                                    //     .UserEmailPasswordController.text
                                                    "name": menuscontroller
                                                        .fbleadname.text,
                                                    //"sri ram",
                                                    "email": menuscontroller
                                                        .fbleademail.text,
                                                    //  "sri965272@gmail.com",
                                                    "phone_number":
                                                        menuscontroller
                                                            .fbleadPhone_number
                                                            .text,
                                                    //  "8686180840",
                                                    "facebook_page_link":
                                                        menuscontroller
                                                            .fbleadfacebook_page_link
                                                            .text,
                                                    //  "https://www.facebook.com/profile.php?id=61553474931502",
                                                    "ad_link": menuscontroller
                                                        .fbleadad_link.text,
                                                    //  "https://ads.google.com/intl/en_us/home/",
                                                    "form_type":
                                                        "facebookAdsLead",
                                                    "user_id":
                                                        userprofilecontroller
                                                                .profileData[
                                                            "user_details"]["id"]
                                                    //"80"
                                                  };

                                                  if (_formKeyOne.currentState!
                                                      .validate()) {
                                                    //   authcontroller.userSignIn(payload);
                                                    // }

                                                    menuscontroller
                                                        .userfbcrm(payload);
                                                    menuscontroller.fbleadname
                                                        .clear();
                                                    menuscontroller.fbleademail
                                                        .clear();
                                                    menuscontroller
                                                        .fbleadPhone_number
                                                        .clear();
                                                    menuscontroller
                                                        .fbleadfacebook_page_link
                                                        .clear();
                                                    menuscontroller
                                                        .fbleadad_link
                                                        .clear();
                                                  }

                                                  // Get.toNamed(kNavigation);
                                                }),
                                      ),
                                      // postRequestfbCrm
                                      // CustomButton(
                                      //     margin: EdgeInsets.only(top: 36.h),
                                      //     borderRadius:
                                      //         BorderRadius.circular(8.r),
                                      //     Color: Kform_border_twg,
                                      //     textColor: Kwhite,
                                      //     height: 40,
                                      //     width: double.infinity,
                                      //     label: "Submits",
                                      //     fontSize: kSixteenFont,
                                      //     fontWeight: kFW700,
                                      //     isLoading: false,
                                      //     onTap: () {
                                      //       // Get.toNamed(kFBAddDemoScreen);
                                      //     }),
                                      CustomButtonOutlined(
                                        margin: EdgeInsets.only(top: 20.h),
                                        label: "Get Demo",
                                        borderColor: Kform_border_twg,
                                        isLoading: false,
                                        fontSize: kSixteenFont,
                                        textColor: KBlack_twg,
                                        onTap: () {
                                          Get.toNamed(kFBAddDemoScreen);
                                        },
                                        fontWeight: kFW500,
                                        Padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 24),
                                      )
                                    ],
                                  ),
                                )
                              : Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        controller: menuscontroller.fbleadname,
                                        labelColor: KText,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Name",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Name",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Name';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        controller: menuscontroller.fbleademail,
                                        labelColor: KText,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Mail ID",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Mail ID",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter mail';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        labelColor: KText,
                                        controller:
                                            menuscontroller.fbleadPhone_number,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Phone Number",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Phone Number",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Phone Number';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomFormFields(
                                        ontap: () {},
                                        enabled: true,
                                        controller:
                                            menuscontroller.fbladwebsite_link,
                                        labelColor: KText,
                                        obscureText: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 8),
                                        fontSize: kFourteenFont,
                                        fontWeight: FontWeight.w500,
                                        hintText: "Enter Website Link",
                                        maxLines: 1,
                                        readOnly: false,
                                        label: "Website Link",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter Website Link';
                                          }
                                          return null;
                                        },
                                      ),
                                      Obx(
                                        () => menuscontroller.webcrmLoading ==
                                                true
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Kform_border_twg,
                                                ),
                                              )
                                            : CustomButton(
                                                margin:
                                                    EdgeInsets.only(top: 36.h),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                Color: Kform_border_twg,
                                                textColor: Kwhite,
                                                height: 40,
                                                width: double.infinity,
                                                label: "Submit",
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW700,
                                                isLoading: false,
                                                onTap: () {
                                                  var payload = {
                                                    // "user_email": authcontroller
                                                    //     .UserEmailSignInController.text,
                                                    // "user_password": authcontroller
                                                    //     .UserEmailPasswordController.text
                                                    "name": menuscontroller
                                                        .fbleadname.text,
                                                    // "sri ram",
                                                    "email": menuscontroller
                                                        .fbleademail.text,
                                                    // "sri965272@gmail.com",
                                                    "phone_number":
                                                        menuscontroller
                                                            .fbleadPhone_number
                                                            .text,
                                                    //"8686180840",
                                                    "website_link":
                                                        menuscontroller
                                                            .fbladwebsite_link
                                                            .text,
                                                    //  "https://www.facebook.com/",
                                                    "form_type":
                                                        "websiteLeadManagement",
                                                    "user_id":
                                                        userprofilecontroller
                                                                .profileData[
                                                            "user_details"]["id"]
                                                    // "80"
                                                  };

                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    //   authcontroller.userSignIn(payload);
                                                    // }

                                                    menuscontroller
                                                        .userWebcrm(payload);
                                                    menuscontroller.fbleadname
                                                        .clear();
                                                    menuscontroller.fbleademail
                                                        .clear();
                                                    menuscontroller
                                                        .fbleadPhone_number
                                                        .clear();

                                                    menuscontroller
                                                        .fbladwebsite_link
                                                        .clear();
                                                  }

                                                  // Get.toNamed(kNavigation);
                                                }),
                                      ),
                                      // CustomButton(
                                      //     margin: EdgeInsets.only(top: 36.h),
                                      //     borderRadius:
                                      //         BorderRadius.circular(8.r),
                                      //     Color: Kform_border_twg,
                                      //     textColor: Kwhite,
                                      //     height: 40,
                                      //     width: double.infinity,
                                      //     label: "Submitss",
                                      //     fontSize: kSixteenFont,
                                      //     fontWeight: kFW700,
                                      //     isLoading: false,
                                      //     onTap: () {}),
                                      CustomButtonOutlined(
                                        margin: EdgeInsets.only(top: 20.h),
                                        label: "Get Demo",
                                        borderColor: Kform_border_twg,
                                        isLoading: false,
                                        fontSize: kSixteenFont,
                                        textColor: KBlack_twg,
                                        onTap: () {
                                          Get.toNamed(kWebAddDemoScreen);
                                        },
                                        fontWeight: kFW500,
                                        Padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 24),
                                      )
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              )))),
    );
  }
}
