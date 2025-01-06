import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

class LogosScreen extends StatefulWidget {
  const LogosScreen({super.key});

  @override
  State<LogosScreen> createState() => _LogosScreenState();
}

class _LogosScreenState extends State<LogosScreen> {
  MenusController menuscontroller = Get.put(MenusController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();
  final List<String> CompanyList = [
    'Minimalist',
    'Vintage',
    'Flat',
    'Geometric',
    'Abstract',
    'Hand-Drawn',
    'Wordmark',
    'Monogram',
    'Emblem',
    'Three_D',
    'Mascot',
    'Pictorial-Mark',
    'Negative-Space',
    'Gradients',
    'Line-Art'
  ];

  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  @override
  void initState() {
    setState(() {
      menuscontroller.logoName.text = "tiger";
      menuscontroller.logoTagline.text = "mobile store";
      menuscontroller.logoSubject.text = "tiger eyes";
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
            "Logo",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(16.r),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Logo",
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
                            CustomFormFields(
                              ontap: () {
                                //  Get.toNamed(kSearchPlaces);
                              },
                              enabled: true,
                              controller: menuscontroller.logoName,
                              labelColor: KText,
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                              hintText:
                                  "What is the name the name of the logo?",
                              maxLines: 1,
                              readOnly: false,
                              label: "Logo Name",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomFormFields(
                              ontap: () {
                                //  Get.toNamed(kSearchPlaces);
                              },
                              enabled: true,
                              controller: menuscontroller.logoTagline,
                              labelColor: KText,
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                              hintText: "Do you have a tagline?",
                              maxLines: 1,
                              readOnly: false,
                              label: "Tagline",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomFormFields(
                              ontap: () {
                                //  Get.toNamed(kSearchPlaces);
                              },
                              enabled: true,
                              controller: menuscontroller.logoSubject,
                              labelColor: KText,
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                              hintText: "The concept you want the logo?",
                              maxLines: 1,
                              readOnly: false,
                              label: "Subject",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Logo Style",
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
                                  'Select Style',
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
                                    return 'Please select Style';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    selectedUserValue = value.toString();
                                    menuscontroller.logoStyle.value =
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
                            Obx(
                              () => menuscontroller.logoLoading == true
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: Kform_border_twg,
                                      ),
                                    )
                                  : CustomButton(
                                      margin: EdgeInsets.only(top: 36.h),
                                      borderRadius: BorderRadius.circular(8.r),
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
                                          "user_id": userprofilecontroller
                                                  .profileData["user_details"]
                                              ["id"],
                                          "words":
                                              menuscontroller.logoName.text,
                                          "tagline":
                                              menuscontroller.logoTagline.text,
                                          "subject":
                                              menuscontroller.logoSubject.text,
                                          "style":
                                              menuscontroller.logoStyle.value,
                                        };

                                        // if (_formKey.currentState!.validate()) {
                                        //   authcontroller.userSignIn(payload);
                                        // }
                                        if (_formKey.currentState!.validate()) {
                                          menuscontroller.userlogo(payload);
                                          menuscontroller.logoName.clear();
                                          menuscontroller.logoTagline.clear();
                                          menuscontroller.logoSubject.clear();
                                        }
                                        // Get.toNamed(kNavigation);
                                      }),
                            ),
                            // CustomButton(
                            //     margin: EdgeInsets.only(top: 36.h),
                            //     borderRadius: BorderRadius.circular(8.r),
                            //     Color: Kform_border_twg,
                            //     textColor: Kwhite,
                            //     height: 40,
                            //     width: double.infinity,
                            //     label: "Submit",
                            //     fontSize: kSixteenFont,
                            //     fontWeight: kFW700,
                            //     isLoading: false,
                            //     onTap: () {
                            //       showDialog(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return AlertDialog(
                            //               backgroundColor: Kwhite,
                            //               title: Text('Final Logo',
                            //                   maxLines: 1,
                            //                   overflow: TextOverflow.ellipsis,
                            //                   style: GoogleFonts.poppins(
                            //                       fontSize: 12.sp,
                            //                       fontWeight: kFW700,
                            //                       color: KText)),
                            //               content: Image.asset(
                            //                 "assets/images/dummyLogo.png",
                            //                 width: 150.w,
                            //                 height: 150.h,
                            //                 fit: BoxFit.fitHeight,
                            //               ),
                            //               actions: [
                            //                 Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.spaceAround,
                            //                   children: [
                            //                     Container(
                            //                       height: 36.h,
                            //                       padding: EdgeInsets.only(
                            //                           left: 14.w, right: 14.w),
                            //                       alignment: Alignment.center,
                            //                       decoration: BoxDecoration(
                            //                         boxShadow: [
                            //                           BoxShadow(
                            //                             color: Ktextcolor
                            //                                 .withOpacity(0.5),
                            //                             blurRadius: 0.5.r,
                            //                             offset: Offset(1, 1),
                            //                             spreadRadius: 0.5.r,
                            //                           )
                            //                         ],
                            //                         color: Kform_border_twg,
                            //                         borderRadius:
                            //                             BorderRadius.all(
                            //                                 Radius.circular(5)),
                            //                       ),
                            //                       child: Text(
                            //                         "Download",
                            //                         textAlign: TextAlign.center,
                            //                         style: GoogleFonts.poppins(
                            //                             fontWeight: kFW500,
                            //                             color: Kwhite,
                            //                             fontSize: kTwelveFont),
                            //                       ),
                            //                     ),
                            //                     Container(
                            //                       height: 36.h,
                            //                       padding: EdgeInsets.only(
                            //                           left: 14.w, right: 14.w),
                            //                       alignment: Alignment.center,
                            //                       decoration: BoxDecoration(
                            //                         boxShadow: [
                            //                           BoxShadow(
                            //                             color: Ktextcolor
                            //                                 .withOpacity(0.5),
                            //                             blurRadius: 5.r,
                            //                             offset: Offset(1, 1),
                            //                             spreadRadius: 1.r,
                            //                           )
                            //                         ],
                            //                         color: Kwhite,
                            //                         borderRadius:
                            //                             BorderRadius.all(
                            //                                 Radius.circular(5)),
                            //                       ),
                            //                       child: Text(
                            //                         "Regenerate",
                            //                         textAlign: TextAlign.center,
                            //                         style: GoogleFonts.poppins(
                            //                             fontWeight: kFW500,
                            //                             color: kblack,
                            //                             fontSize: kTwelveFont),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ],
                            //             );
                            //           });
                            //     }),
                          ],
                        ),
                      ),
                    ),
                 menuscontroller.createDigitalData["response_body"] == null
                        ? SizedBox()
                        : 
                        Column(
                            children: [
                              Container(
                                height: 200.h,
                                margin:
                                    EdgeInsets.only(top: 10.h, bottom: 15.h),
                                padding: EdgeInsets.all(8),
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: kblack.withOpacity(0.3),
                                      blurRadius: 1.r,
                                      offset: Offset(1, 1),
                                      spreadRadius: 1.r,
                                    )
                                  ],
                                  color: Kwhite,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child:
                                      // Image.asset(
                                      //   "assets/images/ai_lady.png",
                                      //   height: 200.h,
                                      //   fit: BoxFit.fill,
                                      //   width: double.infinity,
                                      // ),
                                      CachedNetworkImage(
                                    imageUrl: menuscontroller
                                        .createDigitalData["response_body"],
                                    // multiPostcontroller
                                    //         .mutiPostList[
                                    //     index]["img"],
                                    placeholder: (context, url) => SizedBox(
                                      height: 200.h,
                                      width: double.infinity,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.black12,
                                        highlightColor:
                                            Colors.white.withOpacity(0.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Kwhite.withOpacity(0.5),
                                          ),
                                          height: 200.h,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      // kBaseImageUrl
                                      "assets/images/multipost_image.png",
                                      height: 200.h,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      // width: 25.h,
                                    ),
                                    height: 200.h,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => menuscontroller
                                                .savecreateDigitalLoading ==
                                            true
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Kform_border_twg,
                                            ),
                                          )
                                        : CustomButton(
                                            margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            Color: Kform_border_twg,
                                            textColor: Kwhite,
                                            height: 40,
                                            width: 150.w,
                                            label: "Save",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW700,
                                            isLoading: false,
                                            onTap: () {
                                              var payloaddd = {
                                                "age": menuscontroller
                                                        .createDigitalPayload[
                                                    "age"],
                                                "background": menuscontroller
                                                        .createDigitalPayload[
                                                    "background"],
                                                "country": menuscontroller
                                                        .createDigitalPayload[
                                                    "country"],
                                                "dress": menuscontroller
                                                        .createDigitalPayload[
                                                    "dress"],
                                                "gender": menuscontroller
                                                        .createDigitalPayload[
                                                    "gender"],
                                                "image_url": menuscontroller
                                                        .createDigitalData[
                                                    "response_body"],
                                                // "https://images.pexels.com/photos/3314294/pexels-photo-3314294.jpeg",
                                                "looks": menuscontroller
                                                        .createDigitalPayload[
                                                    "looks"],
                                                "user_id": userprofilecontroller
                                                        .profileData[
                                                    "user_details"]["id"]
                                                // "gender": menuscontroller
                                                //     .influencerGender.value,
                                                // "age": authcontroller
                                                //     .textController.text,
                                                // "country": menuscontroller
                                                //     .digiInfluCountry.text,
                                                // "looks": menuscontroller
                                                //     .digiInfluLooks.text,
                                                // "dress": menuscontroller
                                                //     .digiInfluDress.text,
                                                // "background": menuscontroller
                                                //     .digiInfluBackground.text
                                                // "country": "india",
                                                // "looks": "orange hair, face white",
                                                // "dress": "formal",
                                                // "background": "inside office"
                                              };

                                              // if (_formKey.currentState!.validate()) {
                                              //   authcontroller.userSignIn(payload);
                                              // }

                                              menuscontroller
                                                  .saveusercreateDigital(
                                                      payloaddd);
                                              ;

                                              // Get.toNamed(kNavigation);
                                            }),
                                  ),

                                  // regenaret
                                  Obx(
                                    () => menuscontroller
                                                .createDigitalLoading ==
                                            true
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Kform_border_twg,
                                            ),
                                          )
                                        : CustomButton(
                                            margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            Color: KOrange,
                                            textColor: Kwhite,
                                            height: 40,
                                            width: 150.w,
                                            label: "Regenerate",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW700,
                                            isLoading: false,
                                            onTap: () {
                                              menuscontroller.usercreateDigital(
                                                  menuscontroller
                                                      .createDigitalPayload
                                                      .value);
                                              // if (_formKey.currentState!.validate()) {
                                              //   authcontroller.userSignIn(payload);
                                              // }

                                              // Get.toNamed(kNavigation);
                                            }),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 100.h,
                              )
                            ],
                          ),
                 // 
                  ],
                ),
              ))),
    );
  }
}
