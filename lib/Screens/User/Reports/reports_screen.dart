import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';
import 'dart:math';

import 'package:fast_charts/fast_charts.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  ReportsOrGraphsController reportscontroller =
      Get.put(ReportsOrGraphsController());
  ////////////////////////////
  // class ReportsOrGraphsController extends GetxController {
  // final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());

  ////////////////////////
  final List<String> CompanyList = [
    "facebook",
    "twitter",
    "linkedIn",
    "instagram",
  ];
  List social = [
    "Year",
    "This Month",
    "Last 7 days",
    "Custom",
  ];
  List customs = [
    "Year",
    "This Month",
    "Last 7 days",
    "Custom",
  ];
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  String? selectedUserValue;
  DateTime toselectedDate = DateTime.now();
  DateTime tochoosenDate = DateTime.now();
  var toselectDate = "Select Date".obs;
  String? toselectedUserValue;
  @override
  void initState() {
    setState(() {
      dashboardcontroller.selectedSocialMediaGraph.value = "This Month";
      dashboardcontroller.isCustomSelected.value = false;
    });
    ///////////
    //     'social_type': 'facebook',
    // 'start_date': '',
    // 'end_date': '',
    // 'filter_type': 'current_month',
    // 'user_id': userprofilecontroller.profileData["user_details"]["id"]
    //////
    var payload = {
      "social_type": "facebook",
      "start_date": "",
      "end_date": "",
      "filter_type": "current_month", // last_sevendays
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
      //userprofilecontroller.profileData["user_details"]["id"]
    };
    reportscontroller.userGraphs(payload);
    dashboardcontroller.dashboardTotalSocialPostAPI();
    super.initState();
  }

  void sendApi(String type) {
    if (type == "This Month") {
      var payload = {
        "social_type": dashboardcontroller.selectedSocialMediaType.value,
        "start_date": "",
        "end_date": "",
        "filter_type": "current_month", // last_sevendays
        "user_id": userprofilecontroller.profileData["user_details"]["id"]
      };
      reportscontroller.userGraphs(payload);
    } else if (type == "Year") {
      var payload = {
        "social_type": dashboardcontroller.selectedSocialMediaType.value,
        "start_date": "",
        "end_date": "",
        "filter_type": "current_year", // last_sevendays
        "user_id": userprofilecontroller.profileData["user_details"]["id"]
      };
      reportscontroller.userGraphs(payload);
    } else if (type == "Last 7 days") {
      var payload = {
        "social_type": dashboardcontroller.selectedSocialMediaType.value,
        "start_date": "",
        "end_date": "",
        "filter_type": "last_sevendays", //
        "user_id": userprofilecontroller.profileData["user_details"]["id"]
      };
      // dummy
      reportscontroller.userGraphs(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kwhite,
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // floatingActionButton: InkWell(
        //   onTap: () {},
        //   child: Container(
        //     margin: EdgeInsets.only(bottom: 100.h),
        //     padding: EdgeInsets.only(left: 20.w, right: 20.w),
        //     height: 52,
        //     width: 160.w,
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50.r),
        //       color: Kform_border_twg,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(
        //           "Published",
        //           textAlign: TextAlign.center,
        //           style: GoogleFonts.poppins(
        //             fontSize: kFourteenFont,
        //             color: Kwhite,
        //             fontWeight: kFW600,
        //           ),
        //         ),
        //         CircleAvatar(
        //           radius: 12,
        //           backgroundColor: Kwhite,
        //           child: Icon(
        //             Icons.arrow_forward,
        //             color: Kform_border_twg,
        //             size: 18.sp,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          elevation: 3,
          shadowColor: kblack,
          backgroundColor: Kblue_twg,
          automaticallyImplyLeading: false,
          title: Text(
            "Reports",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          ),
        ),
        body: Obx(() => reportscontroller.graphsLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Kform_border_twg,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Social Media",
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
                      child: Obx(() {
                        // Extract social media names from networkCountList
                        final socialMediaNames = dashboardcontroller
                            .networkCountList
                            .map(
                                (item) => item["name"]?.toString() ?? "Unknown")
                            .toList();

                        if (socialMediaNames.isEmpty) {
                          return Center(
                            child: Text(
                              'No social media available',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: KTextgery.withOpacity(0.5),
                              ),
                            ),
                          );
                        }

                        return DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kblack.withOpacity(0.6), width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Kform_border_twg, width: 1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text(
                            dashboardcontroller.selectedSocialMediaType.value ??
                                'Please select Media',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: KdarkText,
                            ),
                          ),
                          items: socialMediaNames.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Media';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedUserValue = value;
                              dashboardcontroller.selectedSocialMediaType
                                  .value = selectedUserValue!;
                            });
                            print("object");
                          },
                          onSaved: (value) {
                            selectedUserValue = value;
                            print(selectedUserValue);
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
                        );
                      }),
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(top: 10.h),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: Kwhite,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: kblack.withOpacity(0.2),
                    //           blurRadius: 2.r,
                    //           offset: Offset(1, 1),
                    //           spreadRadius: 1.r,
                    //         )
                    //         // BoxShadow(
                    //         //   color: Color(0x3FD3D1D8),
                    //         //   blurRadius: 30,
                    //         //   offset: Offset(15, 15),
                    //         //   spreadRadius: 2,
                    //         // )
                    //       ]),
                    //   child: DropdownButtonFormField2<String>(
                    //     isExpanded: true,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: kblack.withOpacity(0.6), width: 0.5),
                    //         borderRadius: BorderRadius.circular(10.r),
                    //       ),
                    //       errorBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: kblack.withOpacity(0.6), width: 0.5),
                    //         borderRadius: BorderRadius.circular(10.r),
                    //       ),
                    //       disabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: kblack.withOpacity(0.6), width: 0.5),
                    //         borderRadius: BorderRadius.circular(10.r),
                    //       ),
                    //       focusedErrorBorder: OutlineInputBorder(
                    //         borderSide:
                    //             BorderSide(color: Kform_border_twg, width: 1),
                    //         borderRadius: BorderRadius.circular(10.r),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide:
                    //             BorderSide(color: Kform_border_twg, width: 1),
                    //         borderRadius: BorderRadius.circular(10.r),
                    //       ),
                    //       contentPadding: const EdgeInsets.symmetric(
                    //           vertical: 10, horizontal: 8),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //     ),
                    //     hint: Text(
                    //       'Please select Media',
                    //       style: GoogleFonts.poppins(
                    //         fontSize: 14,
                    //         color: KTextgery.withOpacity(0.5),
                    //       ),
                    //     ),
                    //     items:
                    //         CompanyList.map((item) => DropdownMenuItem<String>(
                    //               value: item,
                    //               child: Text(
                    //                 item,
                    //                 style: GoogleFonts.poppins(
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             )).toList(),
                    //     validator: (value) {
                    //       if (value == null) {
                    //         return 'Please select Media';
                    //       }
                    //       return null;
                    //     },
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedUserValue = value.toString();
                    //         setState(() {});
                    //       });
                    //     },
                    //     onSaved: (value) {
                    //       selectedUserValue = value.toString();
                    //       print(selectedUserValue);
                    //       setState(() {});
                    //     },
                    //     buttonStyleData: const ButtonStyleData(
                    //       padding: EdgeInsets.only(right: 8),
                    //     ),
                    //     iconStyleData: IconStyleData(
                    //       icon: Icon(
                    //         Icons.arrow_drop_down,
                    //         color: kblack.withOpacity(0.6),
                    //       ),
                    //       iconSize: 24,
                    //     ),
                    //     dropdownStyleData: DropdownStyleData(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //     menuItemStyleData: const MenuItemStyleData(
                    //       padding: EdgeInsets.symmetric(horizontal: 16),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
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
                                      dashboardcontroller
                                          .selectedSocialMediaGraph
                                          .value = social[index];
                                    });

                                    if (dashboardcontroller
                                            .selectedSocialMediaGraph ==
                                        "Custom") {
                                      if (dashboardcontroller
                                              .isCustomSelected ==
                                          true) {
                                        setState(() {
                                          dashboardcontroller
                                              .isCustomSelected.value = false;
                                        });
                                      } else {
                                        setState(() {
                                          dashboardcontroller
                                              .isCustomSelected.value = true;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        dashboardcontroller
                                            .isCustomSelected.value = false;
                                      });
                                    }
                                    sendApi(social[index]);
                                  },

                                  //
                                  //                                 var payload = {
                                  //   "social_type": "facebook",
                                  //   "start_date": "",
                                  //   "end_date": "",
                                  //   "filter_type": "current_month", // last_sevendays
                                  //   "user_id": userprofilecontroller.profileData["user_details"]["id"]
                                  //   // "sap_plan": authcontroller
                                  //   //     .UserEmailSignInController.text,
                                  // };
                                  // reportscontroller.userGraphs(payload);
                                  //                               //
                                  //                               dashboardcontroller
                                  //                                       .selectedSocialMediaGraph
                                  //                                       .value ==

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
                                                    .selectedSocialMediaGraph ==
                                                social[index]
                                            ? Kblue_twg
                                            : Kwhite,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Text(
                                      social[index],
                                      style: GoogleFonts.poppins(
                                          color: dashboardcontroller
                                                      .selectedSocialMediaGraph ==
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
                    dashboardcontroller.isCustomSelected == true
                        //  dashboardcontroller.selectedSocialMediaGraph == "Custom"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                // height: 38.h,
                                child: CustomFormFields(
                                  hintText:
                                      // selectedDate == DateTime.now()
                                      DateFormat.yMMMd().format(selectedDate) ==
                                              DateFormat.yMMMd()
                                                  .format(DateTime.now())
                                          ? "From Date"
                                          : DateFormat('dd/MM/yyyy')
                                              // DateFormat.yMMMEd()
                                              .format(selectedDate),
                                  ontap: () async {
                                    // setState(() {
                                    //   isFormOpen.value = true;
                                    // });
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(1924, 8),

                                      //  firstDate: DateTime(2015, 8),
                                      lastDate: DateTime(2025, 8),
                                      //  lastDate: DateTime.now(),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              // background: white,
                                              primary: Kform_border_twg,
                                              //onPrimary: white,
                                              onSurface: Colors.black,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                  // primary: Kbluedark,
                                                  ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (picked != null &&
                                        picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;
                                        choosenDate = selectedDate;
                                        selectDate.value =
                                            DateFormat('MM/dd/yyyy')
                                                // DateFormat.yMMMEd()
                                                .format(selectedDate);
                                        dashboardcontroller
                                                .selectedStartDate.value =
                                            DateFormat('MM/dd/yyyy')
                                                // DateFormat.yMMMEd()
                                                .format(selectedDate);
                                      });
                                      // "end_date": dashboardcontroller
                                      //     .selectedEndDate.value,
                                      //  }
                                      // setState(() {
                                      //   selectedDate = picked;
                                      //   choosenDate = selectedDate;
                                      // }
                                      // );
                                    }
                                  },
                                  enabled: true,
                                  readOnly: true,
                                  //keyboardType: TextInput.ke,
                                  labelColor: KText,
                                  onChanged: (Value) {
                                    setState(() {});
                                  },
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 6),
                                  fontSize: 12.sp,
                                  // prefix:
                                  // Image.asset(
                                  //   "assets/images/black_clock.png",
                                  //   height: 8.h,
                                  //   width: 8.w,
                                  // ),
                                  fontWeight: FontWeight.w500,
                                  hintColor:
                                      DateFormat.yMMMd().format(selectedDate) ==
                                              DateFormat.yMMMd()
                                                  .format(DateTime.now())
                                          ? KTextgery.withOpacity(0.5)
                                          : KdarkText,
                                  maxLines: 1,

                                  label: "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please  Enter "From Date"';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                // height: 38.h,
                                child: CustomFormFields(
                                  hintText:
                                      // selectedDate == DateTime.now()
                                      DateFormat.yMMMd()
                                                  .format(toselectedDate) ==
                                              DateFormat.yMMMd()
                                                  .format(DateTime.now())
                                          ? "To Date"
                                          : DateFormat('dd/MM/yyyy')
                                              // DateFormat.yMMMEd()
                                              .format(toselectedDate),
                                  ontap: () async {
                                    // setState(() {
                                    //   isFormOpen.value = true;
                                    // });
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: toselectedDate,
                                      firstDate: DateTime(1924, 8),

                                      //  firstDate: DateTime(2015, 8),
                                      lastDate: DateTime(2025, 8),
                                      //  lastDate: DateTime.now(),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              // background: white,
                                              primary: Kform_border_twg,
                                              //onPrimary: white,
                                              onSurface: Colors.black,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                  // primary: Kbluedark,
                                                  ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (picked != null &&
                                        picked != toselectedDate) {
                                      setState(() {
                                        toselectedDate = picked;
                                        tochoosenDate = toselectedDate;
                                        toselectDate.value =
                                            DateFormat('MM/dd/yyyy')
                                                // DateFormat.yMMMEd()
                                                .format(toselectedDate);
                                        dashboardcontroller
                                                .selectedEndDate.value =
                                            DateFormat('MM/dd/yyyy')
                                                // DateFormat.yMMMEd()
                                                .format(toselectedDate);

                                        // "end_date": dashboardcontroller
                                        //     .selectedEndDate.value,
                                      });
                                      //  }
                                      // setState(() {
                                      //   selectedDate = picked;
                                      //   choosenDate = selectedDate;
                                      // }
                                      // );
                                    }
                                  },
                                  enabled: true,
                                  readOnly: true,
                                  //keyboardType: TextInput.ke,
                                  labelColor: KText,
                                  onChanged: (Value) {
                                    setState(() {});
                                  },
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 6),
                                  fontSize: 12.sp,
                                  // prefix:
                                  // Image.asset(
                                  //   "assets/images/black_clock.png",
                                  //   height: 8.h,
                                  //   width: 8.w,
                                  // ),
                                  fontWeight: FontWeight.w500,
                                  hintColor: DateFormat.yMMMd()
                                              .format(toselectedDate) ==
                                          DateFormat.yMMMd()
                                              .format(DateTime.now())
                                      ? KTextgery.withOpacity(0.5)
                                      : KdarkText,
                                  maxLines: 1,

                                  label: "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please  Enter  To Date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              CustomButton(
                                  margin: EdgeInsets.only(top: 25.h),
                                  borderRadius: BorderRadius.circular(4.r),
                                  Color: Kblue_twg,
                                  textColor: Kwhite,
                                  height: 42,
                                  width: 100.w,
                                  label: "Apply",
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW600,
                                  isLoading: false,
                                  onTap: () {
                                    //                                     var selectedStartDate = "".obs;
                                    // var selectedEndDate = "".obs;

                                    var payload = {
                                      "social_type": dashboardcontroller
                                          .selectedSocialMediaType.value,
                                      "start_date": dashboardcontroller
                                          .selectedStartDate.value,
                                      "end_date": dashboardcontroller
                                          .selectedEndDate.value,
                                      "filter_type": "", // last_sevendays
                                      "user_id": userprofilecontroller
                                          .profileData["user_details"]["id"]
                                      // "sap_plan": authcontroller
                                      //     .UserEmailSignInController.text,
                                    };
                                    reportscontroller.userGraphs(payload);
                                  }),
                            ],
                          )
                        : SizedBox(
                            height: 20.h,
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${dashboardcontroller.selectedSocialMediaType.value} Statistics",
                      style: GoogleFonts.poppins(
                          color: kblack,
                          fontSize: kSixteenFont,
                          fontWeight: kFW500),
                    ),
                    Bargraphs()
                  ],
                ),
              ))));
  }
}
