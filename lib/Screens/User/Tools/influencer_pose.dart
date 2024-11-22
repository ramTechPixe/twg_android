import 'dart:convert';
import 'dart:io';

import 'package:twg/untils/export_file.dart';

class DigitalInfluencerPose extends StatefulWidget {
  const DigitalInfluencerPose({super.key});

  @override
  State<DigitalInfluencerPose> createState() => _DigitalInfluencerPoseState();
}

class _DigitalInfluencerPoseState extends State<DigitalInfluencerPose> {
  final List<String> CompanyList = [
    'Influencer-female-age:22',
    'Influencer-female-age:24',
    'Influencer-female-age:30'
  ];
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  bool showimagenullMessage = false;
  File? selectedImage;
  File? selectedResume;
  File? selectedLetter;
  File? selectedImagetwo;
  String base64Image = "";
  // bool isLoading = false;
  Map typesData = {};
  List<String> options = [];
  int choosenTypeData = 0;
  String choosenOption = "";

  String description = "";
  int? totalAmount;
  String? str;
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
              "Digital Influencer",
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
                        "Create Digital Influencer Pose",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                                      "Digital Influencer Image",
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kSixteenFont,
                                          fontWeight: kFW400),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kblack.withOpacity(0.6),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kblack.withOpacity(0.6),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Kform_border_twg,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Kform_border_twg,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 8),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        hint: Text(
                                          'Select File',
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
                                            selectedUserValue =
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Your Digital influencer",
                                      style: GoogleFonts.poppins(
                                          color: Kform_border_twg,
                                          fontSize: kTwentyFont,
                                          fontWeight: kFW500),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10.h, bottom: 15.h),
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
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          "assets/images/ai_lady.png",
                                          height: 200.h,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          // width: 60.w,
                                          // height: 115.h,
                                          // width: 300.w,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Ktextcolor.withOpacity(0.3),
                                            blurRadius: 5,
                                            offset: const Offset(0, 0),
                                            spreadRadius: 1,
                                          )
                                        ],
                                      ),
                                      child: selectedImage != null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  top: 6.h, bottom: 6.h),
                                              child: Image.file(
                                                selectedImage!,
                                                fit: BoxFit.cover,
                                                height: 130.h,
                                                width: double.infinity,
                                              ),
                                            )
                                          : const Text(
                                              "",
                                              textAlign: TextAlign.center,
                                            ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    GestureDetector(
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
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  height: 100.h,
                                                  padding: EdgeInsets.only(
                                                      top: 20.h),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          chooseImage(
                                                              "Gallery");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .image_outlined,
                                                              color:
                                                                  Kform_border_twg,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text('Gallery',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Kform_border_twg,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text('camera',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
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
                                      },
                                      child: DottedBorder(
                                          dashPattern: [8, 2],
                                          strokeWidth: 1,
                                          color: Kform_border_twg,
                                          child: Container(
                                            height: 135.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              color: Kwhite,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload,
                                                  color: Kform_border_twg,
                                                  size: 35.sp,
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  "Browse Files",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: kSixteenFont,
                                                      color: kblack,
                                                      fontWeight: kFW500),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    CustomButton(
                                        margin: EdgeInsets.only(top: 36.h),
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
                                        onTap: () {}),
                                  ]))),
                    ]))));
  }
}
