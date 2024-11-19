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
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: fontWeight))),
    );
  }
}
