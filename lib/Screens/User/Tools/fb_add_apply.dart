import 'package:twg/untils/export_file.dart';

class FB_ad_apply extends StatefulWidget {
  const FB_ad_apply({super.key});

  @override
  State<FB_ad_apply> createState() => _FB_ad_applyState();
}

class _FB_ad_applyState extends State<FB_ad_apply> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  final List<String> CompanyList = [
    'Facebook Ads Lead Management',
    'Website Lead Management System'
  ];
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  @override
  void initState() {
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
              "Facebook",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
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
                            "Do you Own Company Or Business",
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
                                'Select',
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
                                  return 'Please select  ';
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
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "What Are The Services are you Looking For?",
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
                                'Select',
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
                                  return 'Please select  ';
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
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            enabled: true,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Full Name",
                            maxLines: 1,
                            readOnly: false,
                            label: "Full Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Full Name';
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
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Email",
                            maxLines: 1,
                            readOnly: false,
                            label: "Email",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Email';
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
                            keyboardType: TextInputType.phone,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Mobile",
                            maxLines: 1,
                            readOnly: false,
                            label: "Mobile",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Mobile';
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
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter City",
                            maxLines: 1,
                            readOnly: false,
                            label: "City",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter City';
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
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Company Name",
                            maxLines: 1,
                            readOnly: false,
                            label: "Company Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Company Name';
                              }
                              return null;
                            },
                          ),
                          CustomButton(
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
                              onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
