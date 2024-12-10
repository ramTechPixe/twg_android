import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final List<String> AccountList = ['Insta One', 'Insta two'];
  final List<String> MediaList = ['Instagram', 'Facebook', 'Youtube'];
  String? selectedAccount;
  String? selectedMedia;
  DashboardController dashboardcontroller = Get.put(DashboardController());
  //////
  String _selectedRange = 'No date selected';
  List social = [
    "All",
    "Reels",
    "Video",
    "Live",
    "Post",
    "Stories",
  ];

  ///
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        _selectedRange =
            '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} - ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      });
    }
  }

  ///
  void _showDatePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1.5,
            child: SfDateRangePicker(
              showNavigationArrow: true,
              todayHighlightColor: KDarkPink_twg,
              endRangeSelectionColor: Kblue_twg,
              startRangeSelectionColor: Kblue_twg,
              //  backgroundColor: Kwhite,
              // backgroundColor: KLightPurple_twg,
              rangeSelectionColor: Kblue_twg.withOpacity(0.4),
              selectionColor: Kblue_twg,
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                DateTime.now().add(const Duration(days: 7)),
                DateTime.now(),
              ),
            ),
          ),
        );
      },
    );
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
              "Analytics",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedRange,
                          style: GoogleFonts.poppins(
                            fontSize: kFourteenFont,
                            color: kblack,
                            fontWeight: kFW600,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.access_time,
                              size: 24.sp, color: Colors.blue),
                          onPressed: () => _showDatePickerDialog(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
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
                            'Choose an account',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: KTextgery.withOpacity(0.5),
                            ),
                          ),
                          items: AccountList.map(
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
                              return 'Please Select Services';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedAccount = value.toString();

                              // dashboardcontroller.choosenAutoCRMTool
                              //     .value = value.toString();

                              setState(() {});
                            });
                          },
                          onSaved: (value) {
                            selectedAccount = value.toString();
                            print(selectedAccount);
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
                      Container(
                        width: MediaQuery.of(context).size.width / 2.8,
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
                            'Choose an account',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: KTextgery.withOpacity(0.5),
                            ),
                          ),
                          items:
                              MediaList.map((item) => DropdownMenuItem<String>(
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
                              return 'Please Select Services';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedMedia = value.toString();

                              dashboardcontroller.selectedMediaChannels.value =
                                  value.toString();

                              setState(() {});
                              print("rac");
                            });
                          },
                          onSaved: (value) {
                            selectedMedia = value.toString();
                            print(selectedMedia);
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
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/fb_dark.png",
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Content Overview",
                        style: GoogleFonts.poppins(
                            color: Kform_border_twg,
                            fontSize: kTwentyFont,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
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
                                    dashboardcontroller.selectedAnaliyics
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
                                                  .selectedAnaliyics ==
                                              social[index]
                                          ? Kblue_twg
                                          : Kwhite,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Text(
                                    social[index],
                                    style: GoogleFonts.poppins(
                                        color: dashboardcontroller
                                                    .selectedAnaliyics ==
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
                  dashboardcontroller.selectedMediaChannels.value == 'Instagram'
                      ? AllInstaAnaloitics()
                      : AllFbAnalitics()
                ],
              )),
        ));
  }
}
