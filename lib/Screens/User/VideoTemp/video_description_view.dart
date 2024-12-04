import 'dart:convert';
import 'dart:io';

import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class VideoTemplateDescription extends StatefulWidget {
  const VideoTemplateDescription({super.key});

  @override
  State<VideoTemplateDescription> createState() =>
      _VideoTemplateDescriptionState();
}

class _VideoTemplateDescriptionState extends State<VideoTemplateDescription> {
  File? selectedImage;
  bool showimagenullMessage = false;
  String base64Image = "";
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
              "Video Generator",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(14.r),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/video_image.png",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      "Image Generative Form",
                      style: GoogleFonts.poppins(
                          color: Kform_border_twg,
                          fontSize: 23.sp,
                          fontWeight: kFW600),
                    ),
                    ////////////////
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "STAY AT YOUR<br>DREAM HOUSE",
                            maxLines: 1,
                            readOnly: false,
                            label: "Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Treat yourself<br>this summer",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "&nbsp;",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Port Angeles, WA",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Over the lake",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Enter text...",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Living room with views",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Enter text...",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Kitchen",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "Enter text...",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "_num_",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "just",
                            maxLines: 1,
                            readOnly: false,
                            label: "Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "per night",
                            maxLines: 1,
                            readOnly: false,
                            label: "Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "best-rentals.com",
                            maxLines: 1,
                            readOnly: false,
                            label: "Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
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
                            hintText: "BOOK NOW !",
                            maxLines: 1,
                            readOnly: false,
                            label: "Component Text:",
                            validator: (value) {
                              if (value!.isEmpty) {}
                            },
                          ),
                          SizedBox(
                            height: 20.h,
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
                                    padding:
                                        EdgeInsets.only(top: 6.h, bottom: 6.h),
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130.h,
                                      width: double.infinity,
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Image:",
                            style: GoogleFonts.poppins(
                                fontSize: kSixteenFont,
                                color: kblack,
                                fontWeight: kFW400),
                          ),
                          SizedBox(
                            height: 8.h,
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 100.h,
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('Gallery',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                                    Icons.camera_alt_outlined,
                                                    color: Kform_border_twg,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text('camera',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: kFW700,
                                                          color: KdarkText)),
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
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Kwhite,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          Container(
                            padding: EdgeInsets.only(left: 12.w, right: 12.w),
                            height: 40,
                            margin: EdgeInsets.only(top: 40.h, bottom: 15.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Kform_border_twg,
                            ),
                            child: Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: kFourteenFont,
                                color: Kwhite,
                                fontWeight: kFW600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ////////////////
                  ])),
        ));
  }
}
