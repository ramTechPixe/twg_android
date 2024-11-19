// ignore_for_file: must_be_immutable
import 'package:twg/untils/export_file.dart';

class CustomButton extends StatelessWidget {
  String label;
  double? height;
  double? width;
  double? fontSize;
  FontWeight? fontWeight;
  final Color;
  final textColor;
  var Padding;
  var margin;
  BorderRadiusGeometry? borderRadius;

  bool isLoading;
  dynamic onTap;

  CustomButton(
      {Key? key,
      this.height,
      this.width,
      this.Padding,
      this.Color,
      this.textColor,
      this.margin,
      this.fontSize,
      this.fontWeight,
      this.borderRadius,
      required this.label,
      required this.isLoading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: Padding,
          height: height,
          width: width,
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
            color: Color,
            borderRadius: borderRadius,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: fontSize, color: textColor, fontWeight: fontWeight),
          ),
        ));
  }
}

// TWG
class CustomButtonGradientOutlined extends StatelessWidget {
  String label;
  double? height;
  double? width;
  double? fontSize;
  FontWeight? fontWeight;
  final Color;
  final textColor;
  var Padding;
  var margin;
  BorderRadiusGeometry? borderRadius;

  bool isLoading;
  dynamic onTap;

  CustomButtonGradientOutlined(
      {Key? key,
      this.height,
      this.width,
      this.Padding,
      this.Color,
      this.textColor,
      this.margin,
      this.fontSize,
      this.fontWeight,
      this.borderRadius,
      required this.label,
      required this.isLoading,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: margin,
          padding: Padding,
          height: 40,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  KGradientPurple_twg,
                  KGradientPink_twg,
                  KLightPurple_twg
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Text(label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: fontSize, color: textColor, fontWeight: fontWeight))
          // Text(
          //   label,
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.roboto(
          //       fontSize: fontSize, color: textColor, fontWeight: fontWeight),
          // ),
          ),
    );
  }
}


//////////////////////////////////////
  //  Container(
  //                                       // width: 120,
  //                                       height: 40,
  //                                       padding: EdgeInsets.symmetric(
  //                                           vertical: 8, horizontal: 24),
                                       
  //                                       decoration: BoxDecoration(
  //                                           border: GradientBoxBorder(
  //                                             gradient: LinearGradient(colors: [
  //                                               KGradientPurple_twg,
  //                                               KGradientPink_twg,
  //                                               KLightPurple_twg
  //                                             ]),
  //                                             width: 2.w,
  //                                           ),
  //                                           borderRadius:
  //                                               BorderRadius.circular(8)),
  //                                       child: Text("Next",
  //                                           textAlign: TextAlign.center,
  //                                           style: GoogleFonts.poppins(
  //                                               fontSize: kSixteenFont,
  //                                               fontWeight: kFW500,
  //                                               color: KBlack_twg)),
  //                                     ),