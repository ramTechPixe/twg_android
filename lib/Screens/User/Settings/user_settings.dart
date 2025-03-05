import 'package:twg/untils/export_file.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  bool _isAnaliticsExpandCard = false;
  bool isAnaliticsSwitched = false;
  bool isTimestampSwitched = false;
  bool ispostingSwitched = false;
  void toggletimestampSwitch(bool value) async {
    if (isTimestampSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isTimestampSwitched = true;
        //  _isfbExpandCard = true;
      });
    } else {
      setState(() {
        isTimestampSwitched = false;
        //   _isfbExpandCard = false;
      });
    }
  }

  void togglePostingSwitch(bool value) async {
    if (ispostingSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        ispostingSwitched = true;
        //  _isfbExpandCard = true;
      });
    } else {
      setState(() {
        ispostingSwitched = false;
        //   _isfbExpandCard = false;
      });
    }
  }

  // togglePostingSwitch
  void toggleAnaliticsSwitch(bool value) async {
    if (isAnaliticsSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isAnaliticsSwitched = true;
        //  _isfbExpandCard = true;
      });
    } else {
      setState(() {
        isAnaliticsSwitched = false;
        //   _isfbExpandCard = false;
      });
    }
  }

  List social = [
    "General",
    "facebook",
    "twitter",
    "linkedIn",
    "tumbler",
    "pinterest",
    "Google Business Profile",
    "instagram",
    "youtube",
    "wordPress",
  ];
  final List<String> CompanyList = [
    'Kolkata',
    'Delhi',
  ];
  void checkInternet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected == false) {
      Get.toNamed(kNointernetScreen);
    }
    // debugPrint("${isConnected}");
  }

  ////
  /////
  AccontsController accountsController = Get.put(AccontsController());
  String? selectedUserValue;
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 0));

    // setState(() {
    //   items = List.generate(20, (index) => 'New Item ${index + 1}');
    // });
    checkInternet();

    loadAccounts();
  }

  void loadAccounts() async {
    accountsController.userSMFbAccountsList();
    accountsController.userPinterestAccountsList();
    accountsController.userTwitterAccountsList();
    accountsController.usertumblerAccountsList();
    accountsController.userYouTubeAccountsList();

    // accountscontroller.useryoutubeAccountsList();
    accountsController.userredditAccountsList();
    accountsController.userInstaAccountsList();
    // bool isConnected = await InternetConnection().hasInternetAccess;
    // if (isConnected == false) {
    //   Get.toNamed(kNointernetScreen);
    // }
    // debugPrint("${isConnected}");
  }

  @override
  void initState() {
    // authcontroller.usersuscribtiondataAPI();
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
      appBar: AppBar(
        elevation: 3,
        shadowColor: kblack,
        backgroundColor: Kblue_twg,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
              color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
        ),
      ),
      backgroundColor: Kwhite,
      body: RefreshIndicator(
        color: Kblue_twg,
        displacement: 200.h,
        onRefresh: _refreshData,
        child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: social.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      dashboardcontroller.selectedSocialPlatform
                                          .value = social[index];
                                    });
                                    print("object");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        top: 8.h,
                                        bottom: 8.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Kblue_twg, width: 1),
                                        color: dashboardcontroller
                                                    .selectedSocialPlatform ==
                                                social[index]
                                            ? Kblue_twg
                                            : Kwhite,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Text(
                                      social[index],
                                      style: GoogleFonts.poppins(
                                          color: dashboardcontroller
                                                      .selectedSocialPlatform ==
                                                  social[index]
                                              ? Kwhite
                                              : kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW500),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    dashboardcontroller.selectedSocialPlatform == "General"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time Zone",
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
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
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
                                    'Select Time zone',
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
                                      return 'Please select Time Zone';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      selectedUserValue = value.toString();
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 15.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Ktextcolor.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Google Analytics Campaign Tracking",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                color: kblack,
                                                fontWeight: kFW500),
                                          ),
                                          Transform.scale(
                                            scale: 0.6,
                                            child: Switch(
                                              onChanged: (value) {
                                                // setState(() {
                                                //   _isfbExpandCard = !_isfbExpandCard;
                                                // });
                                                toggleAnaliticsSwitch(value);
                                              },
                                              value: isAnaliticsSwitched,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              activeColor: KLightDust_twg,
                                              activeTrackColor:
                                                  Kform_border_twg,
                                              inactiveThumbColor:
                                                  KLightDust_twg,
                                              inactiveTrackColor:
                                                  Kdim_brown_twg,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Enable campaign tracking if you want to see how much traffic is generated by Social Auto Poster.",
                                        style: GoogleFonts.poppins(
                                            fontSize: 11.sp,
                                            color: kblack,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  )),

                              Container(
                                  margin: EdgeInsets.only(top: 15.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Ktextcolor.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Enable Social Posting Logs",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                color: kblack,
                                                fontWeight: kFW500),
                                          ),
                                          Transform.scale(
                                            scale: 0.6,
                                            child: Switch(
                                              onChanged: (value) {
                                                // setState(() {
                                                //   _isfbExpandCard = !_isfbExpandCard;
                                                // });
                                                togglePostingSwitch(value);
                                              },
                                              value: ispostingSwitched,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              activeColor: KLightDust_twg,
                                              activeTrackColor:
                                                  Kform_border_twg,
                                              inactiveThumbColor:
                                                  KLightDust_twg,
                                              inactiveTrackColor:
                                                  Kdim_brown_twg,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Enable this to store your social posting activities into the database which can be viewed from 'Logs' section.",
                                        style: GoogleFonts.poppins(
                                            fontSize: 11.sp,
                                            color: kblack,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Ktextcolor.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Enable Timestamp Link",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                color: kblack,
                                                fontWeight: kFW500),
                                          ),
                                          Transform.scale(
                                            scale: 0.6,
                                            child: Switch(
                                              onChanged: (value) {
                                                // setState(() {
                                                //   _isfbExpandCard = !_isfbExpandCard;
                                                // });
                                                toggletimestampSwitch(value);
                                              },
                                              value: isTimestampSwitched,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              activeColor: KLightDust_twg,
                                              activeTrackColor:
                                                  Kform_border_twg,
                                              inactiveThumbColor:
                                                  KLightDust_twg,
                                              inactiveTrackColor:
                                                  Kdim_brown_twg,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Enable this to send timestamp with Social Link post.Save",
                                        style: GoogleFonts.poppins(
                                            fontSize: 11.sp,
                                            color: kblack,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  )),
                              // CustomButton(
                              //     borderRadius: BorderRadius.circular(5.r),
                              //     Color: Kform_border_twg,
                              //     textColor: Kwhite,
                              //     height: 45,
                              //     width: 105.w,
                              //     label: "Select All",

                              //     isLoading: false,
                              //     onTap: () {}),

                              InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                    msg: "Not Available Now",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: KDarkPink_twg,
                                    textColor: Kwhite,
                                    fontSize: 16.0,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 26),
                                  // "7"
                                  height: 45,
                                  width: 120.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Ktextcolor.withOpacity(0.5),
                                    //     blurRadius: 5.r,
                                    //     offset: Offset(0, 5),
                                    //     spreadRadius: 1.r,
                                    //   )
                                    // ],
                                    color: Kform_border_twg,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Icon(
                                      //   Icons.shopping_bag,
                                      //   color: Kwhite,
                                      // ),
                                      Image.asset(
                                        "assets/images/Vector.png",
                                        // height: 3.h,
                                        // width: 80.w,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        "Save",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: kFW600,
                                            color: Kwhite,
                                            fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        :
                        // TwitterSettings
                        dashboardcontroller.selectedSocialPlatform == "facebook"
                            ? FacebbokSettings()
                            : dashboardcontroller.selectedSocialPlatform ==
                                    "twitter"
                                ? TwitterSettings()
                                : dashboardcontroller.selectedSocialPlatform ==
                                        "linkedIn"
                                    ? Linkedinn()
                                    : dashboardcontroller
                                                .selectedSocialPlatform ==
                                            "tumbler"
                                        ?
                                        //
                                        Tumblr()
                                        : dashboardcontroller
                                                    .selectedSocialPlatform ==
                                                "pinterest"
                                            ? PinterestSettings()
                                            : dashboardcontroller
                                                        .selectedSocialPlatform ==
                                                    "Google Business Profile"
                                                ? GoogleBusinees()
                                                : dashboardcontroller
                                                            .selectedSocialPlatform ==
                                                        "instagram"
                                                    ? Instagram()
                                                    : dashboardcontroller
                                                                .selectedSocialPlatform ==
                                                            "youtube"
                                                        ? YouTube()
                                                        : WordPress()
                  ],
                ))),
      ),
    );
  }
}
