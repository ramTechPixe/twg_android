import 'dart:convert';
import 'dart:io';

import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';

class AddMultiScreen extends StatefulWidget {
  const AddMultiScreen({super.key});

  @override
  State<AddMultiScreen> createState() => _AddMultiScreenState();
}

class _AddMultiScreenState extends State<AddMultiScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  List<String> yourOptionsList = ['Option 1', 'Option 2', 'Option 3'];
  bool value = false;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  List social = ["Facebook", "Twitter", "LinkedIn", "Instagram"];
  String base64Image = "";
  String? selectedOption;
  bool showimagenullMessage = false;
  File? selectedImage;
  final List<String> CompanyList = [
    'Ram',
    'Suresh',
  ];

  String? selectedUserValue;
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
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
              "Add Multi-Post Content",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(14.r),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        enabled: true,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Add Content",
                        maxLines: 6,
                        readOnly: false,
                        label: "Add Content",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Add Content';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        enabled: true,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Content Link",
                        maxLines: 1,
                        readOnly: false,
                        label: "Link",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Link';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          selectedImage != null
                              ? Container(
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Klight_grey_twg, width: 1),
                                    color: Kwhite,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.file(
                                        selectedImage!,
                                        width: 100.w,
                                        height: 120.h,
                                        //   fit: BoxFit.cover,
                                        fit: BoxFit.cover,
                                        // height: 100.h,
                                        // width: 100.w,
                                        // fit: BoxFit.cover,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedImage = null;
                                          });
                                          setState(() {});
                                        },
                                        child: Text('X',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 20.sp,
                                                fontWeight: kFW600,
                                                color: Klight_grey_twg)),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              selectedImage == null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedImage = null;
                                        });
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 110,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Klight_grey_twg, width: 1),
                                          color: Kwhite,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/delete.png",
                                              height: 24,
                                              width: 24,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "Delete",
                                              style: GoogleFonts.poppins(
                                                  color: Klight_grey_twg,
                                                  fontSize: kSixteenFont,
                                                  fontWeight: kFW600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              CustomButton(
                                  borderRadius: BorderRadius.circular(5.r),
                                  Color: Kform_border_twg,
                                  textColor: Kwhite,
                                  height: 45,
                                  width: 155.w,
                                  label: "+ Browser.....",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW600,
                                  isLoading: false,
                                  onTap: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20)),
                                        ),
                                        backgroundColor: Kbackground,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Kbackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 100.h,
                                              padding:
                                                  EdgeInsets.only(top: 20.h),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      chooseImage("Gallery");
                                                      Navigator.pop(context);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons.image_outlined,
                                                          color: Kblue_twg,
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text('Gallery',
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                      ],
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      chooseImage("camera");
                                                      Navigator.pop(context);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .camera_alt_outlined,
                                                          color: Kblue_twg,
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text('camera',
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                            ],
                          ),
                        ],
                      )
                      //
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 18,
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
                                    border:
                                        Border.all(color: Kblue_twg, width: 1),
                                    color: dashboardcontroller
                                                .selectedSocialPlatform ==
                                            social[index]
                                        ? Kblue_twg
                                        : Kwhite,
                                    borderRadius: BorderRadius.circular(10.r)),
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
                //////
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        enabled: true,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Unpublished",
                        maxLines: 1,
                        readOnly: true,
                        label: "Status",
                        validator: (value) {
                          if (value!.isEmpty) {}
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Ktextcolor.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(4.r)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Post To This Facebook Account(s)",
                          style: GoogleFonts.poppins(
                              fontSize: kSixteenFont,
                              color: kblack,
                              fontWeight: kFW500),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Kwhite,
                          ),
                          child: ChipsInputAutocomplete(
                            showClearButton: true,
                            widgetContainerDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: KText_border_twg, width: 0.5)),

                            // addChipOnSelection: true,
                            // placeChipsSectionAbove: true,
                            autoFocus: false,
                            // enabled: true,
                            // keyboardType: TextInputType.none,
                            decorationTextField: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                color: KLighText_twg,
                                fontSize: 14.sp,
                                fontWeight: kFW400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: KText_border_twg, width: 0.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            options: yourOptionsList,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                          style: GoogleFonts.poppins(
                              fontSize: kTenFont,
                              color: kblack,
                              fontWeight: kFW400),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(
                                // margin: EdgeInsets.only(top: 36.h),
                                borderRadius: BorderRadius.circular(5.r),
                                Color: Kform_border_twg,
                                textColor: Kwhite,
                                height: 45,
                                width: 105.w,
                                label: "Select All",
                                fontSize: kSixteenFont,
                                fontWeight: kFW600,
                                isLoading: false,
                                onTap: () {}),
                            Container(
                              height: 45,
                              alignment: Alignment.center,
                              width: 140,
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Klight_grey_twg, width: 1),
                                color: KPale_white_twg,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              child: Text(
                                "Select None",
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )),
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
                      children: [
                        Text(
                          "Share posting type",
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
                              'Select Type',
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
                                return 'Please select User.';
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
                          ontap: () {
                            //  Get.toNamed(kSearchPlaces);
                          },
                          enabled: true,
                          //    controller: userprofilecontroller.editFirstNameController,
                          labelColor: KText,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "Enter Custom Link",
                          maxLines: 1,
                          readOnly: false,
                          label: "Custom Link",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Custom Link';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormFields(
                        ontap: () {},
                        enabled: true,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Custom Message",
                        maxLines: 4,
                        readOnly: false,
                        label: "Custom Message",
                        validator: (value) {
                          if (value!.isEmpty) {}
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
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
                  child: Column(
                    children: [
                      CustomFormFields(
                        hintText:
                            // selectedDate == DateTime.now()
                            DateFormat.yMMMd().format(selectedDate) ==
                                    DateFormat.yMMMd().format(DateTime.now())
                                ? "Select Date"
                                : DateFormat('dd/MM/yyyy')
                                    // DateFormat.yMMMEd()
                                    .format(selectedDate),
                        ontap: () {},
                        enabled: true,
                        readOnly: true,
//keyboardType: TextInput.ke,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        prefix: InkWell(
                          onTap: () async {
                            // setState(() {
                            //   isFormOpen.value = true;
                            // });
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(1924, 8),

                              //  firstDate: DateTime(2015, 8),
                              lastDate: DateTime(2025, 8),
                              //  lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      // background: white,
                                      primary: Kform_border_twg,
                                      //onPrimary: white,
                                      onSurface: Colors.black,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          // primary: Kbluedark,
                                          ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                                choosenDate = selectedDate;
                                selectDate.value = DateFormat('MM/dd/yyyy')
                                    // DateFormat.yMMMEd()
                                    .format(selectedDate);
                              });
                              //  }
                              // setState(() {
                              //   selectedDate = picked;
                              //   choosenDate = selectedDate;
                              // }
                              // );
                            }
                          },
                          child: Image.asset(
                            "assets/images/black_clock.png",
                            height: 10.h,
                            width: 10.w,
                          ),
                        ),
                        fontWeight: FontWeight.w500,
                        hintColor: DateFormat.yMMMd().format(selectedDate) ==
                                DateFormat.yMMMd().format(DateTime.now())
                            ? KTextgery.withOpacity(0.5)
                            : KdarkText,
                        maxLines: 1,

                        label: "Schedule Individual",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please  Schedule Individual';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: CustomFormFields(
                              hintText:
                                  // selectedDate == DateTime.now()
                                  DateFormat.yMMMd().format(selectedDate) ==
                                          DateFormat.yMMMd()
                                              .format(DateTime.now())
                                      ? "Select Date"
                                      : DateFormat('dd/MM/yyyy')
                                          // DateFormat.yMMMEd()
                                          .format(selectedDate),
                              ontap: () {},
                              enabled: true,
                              readOnly: true,
//keyboardType: TextInput.ke,
                              labelColor: KText,
                              onChanged: (Value) {
                                setState(() {});
                              },
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              prefix: InkWell(
                                onTap: () async {
                                  // setState(() {
                                  //   isFormOpen.value = true;
                                  // });
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(1924, 8),

                                    //  firstDate: DateTime(2015, 8),
                                    lastDate: DateTime(2025, 8),
                                    //  lastDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            // background: white,
                                            primary: Kform_border_twg,
                                            //onPrimary: white,
                                            onSurface: Colors.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
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
                                    });
                                    //  }
                                    // setState(() {
                                    //   selectedDate = picked;
                                    //   choosenDate = selectedDate;
                                    // }
                                    // );
                                  }
                                },
                                child: Image.asset(
                                  "assets/images/black_clock.png",
                                  height: 10.h,
                                  width: 10.w,
                                ),
                              ),
                              fontWeight: FontWeight.w500,
                              hintColor: DateFormat.yMMMd()
                                          .format(selectedDate) ==
                                      DateFormat.yMMMd().format(DateTime.now())
                                  ? KTextgery.withOpacity(0.5)
                                  : KdarkText,
                              maxLines: 1,

                              label: "Schedule Global",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please  Schedule';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Ktextcolor.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(4.r)),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.info),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 220.w,
                                    child: Text(
                                      "Note: You can only schedule the content if the current status set to unpublished.",
                                      style: GoogleFonts.poppins(
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 26),
                            height: 45,
                            width: 120.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Kform_border_twg,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Vector.png",
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
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
