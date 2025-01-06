import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class TotalsList extends StatefulWidget {
  const TotalsList({super.key});

  @override
  State<TotalsList> createState() => _TotalsListState();
}

class _TotalsListState extends State<TotalsList> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  // final TextEditingController _searchController = TextEditingController();
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
  MenusController menuscontroller = Get.put(MenusController());
  int _characterCount = 0;
  bool value = false;

  @override
  void initState() {
    menuscontroller.userautoCommentslistAPI();
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
            child: Obx(
              () => menuscontroller.getCommentsdataLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Kform_border_twg,
                      ),
                    )
                  : Column(
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 8),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          hintText: "Search here..",
                          maxLines: 1,
                          readOnly: false,
                          label: "",
                          onChanged: (value) {
                            setState(() {
                              //                                   apiController.assetsData = apiController.OriginalassetsData;
                              // apiController.assetsData = apiController.assetsDatafilter;
                              menuscontroller.autoCommentsList.value =
                                  menuscontroller.filterautoCommentsList
                                      .where((element) => element["name"]
                                          //
                                          // .where((element) => element["message"]
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              value.toString().toLowerCase()))
                                      .toList();
                            });
                            if (value == "") {
                              //  apiController.getRceiversLocationforBank();
                              setState(() {
                                menuscontroller.autoCommentsList.value =
                                    menuscontroller.originalautoCommentsList;
                              });
                            }
                            if (menuscontroller.autoCommentsList.isEmpty &&
                                value != "") {
                              Fluttertoast.showToast(
                                  msg: "No posts Available ,Search Again");

                              setState(() {
                                menuscontroller.userautoCommentslistAPI();
                              });
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter data';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Checkbox(
                        //         activeColor: Kblue_twg,
                        //         checkColor: Kwhite,
                        //         value: value,
                        //         onChanged: (value) {
                        //           setState(() {
                        //             this.value = value!;
                        //           });
                        //           print(value);
                        //         },
                        //       ),
                        //       Text(
                        //         "Select All",
                        //         style: GoogleFonts.poppins(
                        //             color: kblack,
                        //             fontSize: kSixteenFont,
                        //             fontWeight: kFW400),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // ram
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: menuscontroller.autoCommentsList.length,
                            itemBuilder: (context, index) {
                              return Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              // MediaQuery.of(context).size.width / 2.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Service Type",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kFourteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    menuscontroller.autoCommentsList[
                                                                index]
                                                            ["service_type"] ??
                                                        "",
                                                    //   "auto_comments_reply",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: Klight_grey_twg,
                                                        fontSize: kTwelveFont,
                                                        fontWeight: kFW400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.9,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Demo Time",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kFourteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    menuscontroller.autoCommentsList[
                                                                index]
                                                            ["demo_schedule"] ??
                                                        "",
                                                    // "2024-12-23 18:23:40",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Customer Name",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kFourteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    menuscontroller
                                                                .autoCommentsList[
                                                            index]["name"] ??
                                                        "",

                                                    // "Bheemi Bhargav",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: Klight_grey_twg,
                                                        fontSize: kTwelveFont,
                                                        fontWeight: kFW400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.9,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Company",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kFourteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    menuscontroller.autoCommentsList[
                                                                index]
                                                            ["company_name"] ??
                                                        "",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Email",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kFourteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    menuscontroller
                                                                .autoCommentsList[
                                                            index]["email"] ??
                                                        "",
                                                    // "sram@gmail.com",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: Klight_grey_twg,
                                                        fontSize: kTwelveFont,
                                                        fontWeight: kFW400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.9,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    // "Created Date",
                                                    "            ",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Mobile Number",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kFourteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    menuscontroller
                                                                .autoCommentsList[
                                                            index]["mobile"] ??
                                                        "",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.9,
                                              //  margin: EdgeInsets.only(top: 20.h),
                                              label: "View Account",
                                              borderColor: Kform_border_twg,
                                              isLoading: false,
                                              fontSize: kTwelveFont,
                                              textColor: KBlack_twg,
                                              onTap: () {
                                                _launchURL(menuscontroller
                                                            .autoCommentsList[
                                                        index]["account_link"] ??
                                                    "");
                                              },
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
                              );
                            })
                      ],
                    ),
            )),
      ),
    );
  }

  _launchURL(String web) async {
    final Uri url = Uri.parse(web);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
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
