import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class TotalsList extends StatefulWidget {
  const TotalsList({super.key});

  @override
  State<TotalsList> createState() => _TotalsListState();
}

class _TotalsListState extends State<TotalsList> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
  int _characterCount = 0;
  bool value = false;

  @override
  void initState() {
    super.initState();
  }

  String? selectedVariant;

  // Your dropdown data
  final List<String> variantsList = [
    'Active',
    'Pending',
    'Expired',
    'Cancelled',
  ];
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
            "Total List",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomFormFields(
                ontap: () {},
                enabled: true,
                labelColor: KText,
                obscureText: false,
                suffix: GestureDetector(
                  onTap: () {
                    _showDropdown(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/post_filter.png",
                      height: 10,
                      width: 10,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                hintText: "Search here..",
                maxLines: 1,
                readOnly: false,
                label: "",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter data';
                  }
                  return null;
                },
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      activeColor: Kblue_twg,
                      checkColor: Kwhite,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                        print(value);
                      },
                    ),
                    Text(
                      "Select All",
                      style: GoogleFonts.poppins(
                          color: kblack,
                          fontSize: kSixteenFont,
                          fontWeight: kFW400),
                    ),
                  ],
                ),
              ),

              // ram
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: 
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 15.h, left: 2.w, right: 2.w),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kblack.withOpacity(0.1),
                              blurRadius: 2.r,
                              offset: const Offset(0, 1),
                              spreadRadius: 2.r,
                            )
                          ],
                          color: Kwhite,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 30.h),
                                  child: Image.asset(
                                    "assets/images/light_logo.png",
                                    height: 150.h,
                                    width: 150.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      // MediaQuery.of(context).size.width / 2.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Service Type",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "auto_comments_reply",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Demo Time",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "2024-12-23 18:23:40",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Customer Name",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "Bheemi Bhargav",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Created Date",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "2024-10-03 11:48:27",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Email",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "sram@gmail.com",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // "Created Date",
                                            "            ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            // "2024-10-03 11:48:27",
                                            "                   ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mobile Number",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "9381022559",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Klight_grey_twg,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        child: CustomButtonOutlined(
                                      width: MediaQuery.of(context).size.width /
                                          2.9,
                                      //  margin: EdgeInsets.only(top: 20.h),
                                      label: "View Account",
                                      borderColor: Kform_border_twg,
                                      isLoading: false,
                                      fontSize: kTwelveFont,
                                      textColor: KBlack_twg,
                                      onTap: () {},
                                      fontWeight: kFW500,
                                      Padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 5),
                                    )
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Text(
                                        //       "Created Date",
                                        //       maxLines: 1,
                                        //       overflow: TextOverflow.ellipsis,
                                        //       style: GoogleFonts.poppins(
                                        //           color: kblack,
                                        //           fontSize: kFourteenFont,
                                        //           fontWeight: kFW600),
                                        //     ),
                                        //     SizedBox(
                                        //       height: 3.h,
                                        //     ),
                                        //     Text(
                                        //       "2024-10-03 11:48:27",
                                        //       maxLines: 1,
                                        //       overflow: TextOverflow.ellipsis,
                                        //       style: GoogleFonts.poppins(
                                        //           color: Klight_grey_twg,
                                        //           fontSize: kTwelveFont,
                                        //           fontWeight: kFW400),
                                        //     ),
                                        //   ],
                                        // ),

                                        ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Icon(Icons.check_box),
                        //     SizedBox(
                        //       width: 250.w,
                        //       child: Text(
                        //         "100",
                        //         style: GoogleFonts.poppins(
                        //             color: kblack,
                        //             fontSize: kFourteenFont,
                        //             fontWeight: kFW400),
                        //       ),
                        //     ),
                        //     Image.asset(
                        //       "assets/images/deleted_image.png",
                        //       height: 25.h,
                        //       width: 25.h,
                        //     ),
                        //   ],
                        // ),
                      ),
                      //   Container(
                      //     margin: EdgeInsets.only(bottom: 10.h),
                      //     padding: EdgeInsets.all(5),
                      //     child: Row(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Icon(Icons.check_box),
                      //         SizedBox(
                      //           width: 250.w,
                      //           child: Text(
                      //             semicontroller.scheduledList[
                      //                     index]["message"] ??
                      //                 "",

                      //             //    "Discover how social media automation can transform your....",
                      //             style: GoogleFonts.poppins(
                      //                 color: kblack,
                      //                 fontSize: kFourteenFont,
                      //                 fontWeight: kFW400),
                      //           ),
                      //         ),
                      //         Image.asset(
                      //           "assets/images/deleted_image.png",
                      //           height: 25.h,
                      //           width: 25.h,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ],
                      // ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  //
  void _showDropdown(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(200, 200, 0, 0),
      // position: RelativeRect.fromLTRB(200, 300, 0, 0), // Adjust as needed
      items: variantsList
          .map(
            (variant) => PopupMenuItem<String>(
              value: variant,
              child: Text(variant),
            ),
          )
          .toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedVariant = value;
        });
        // Handle item selection
        print("Selected Variant: $selectedVariant");
      }
    });
  }
}
