// import 'dart:io';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img_lib;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:crop_your_image/crop_your_image.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:stack_art_board/stack_art_board.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:twg/untils/export_file.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:image/image.dart' as img_lib;
// import 'package:onscreen_keyboard/onscreen_keyboard.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final StackArtBoardController controller = StackArtBoardController();
//   DashboardController dashboardcontroller = Get.put(DashboardController());
//   final CropController cropController = CropController();
//   final GlobalKey _repaintBoundaryKey = GlobalKey();
//   Uint8List _imageData = Uint8List(0);
//   double _fontSize = 20;
//   Color _textColor = Colors.black;
//   String _fontFamily = 'Roboto';
//   var selectedData = Get.arguments[0];

//   final TextEditingController _textController = TextEditingController();

//   Color _containerColor = Colors.white;

//   void _openContainerDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.all(0),
//           contentPadding: EdgeInsets.zero,
//           title: Text(
//             'Select Container Color',
//             style: GoogleFonts.poppins(
//                 color: Kform_border_twg,
//                 fontSize: kTwentyFont,
//                 fontWeight: kFW500),
//           ),
//           content: SizedBox(
//             height: double.infinity,
//             width: double.maxFinite,
//             child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     CustomButton(
//                       margin: EdgeInsets.only(top: 36.h),
//                       borderRadius: BorderRadius.circular(8.r),
//                       Color: Kform_border_twg,
//                       textColor: Kwhite,
//                       height: 40,
//                       width: 200.w,
//                       label: "Select Colour",
//                       fontSize: kSixteenFont,
//                       fontWeight: kFW700,
//                       isLoading: false,
//                       onTap: () async {
//                         Color? color = await showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text('Pick Container Color'),
//                               content: SingleChildScrollView(
//                                 child: ColorPicker(
//                                   pickerColor: _containerColor,
//                                   onColorChanged: (color) => setState(() {
//                                     _containerColor = color;
//                                   }),
//                                   showLabel: false,
//                                 ),
//                               ),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: const Text('Got it'),
//                                   onPressed: () {
//                                     Navigator.of(context).pop(_containerColor);
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                         if (color != null) {
//                           setState(() {
//                             _containerColor = color;
//                           });
//                         }
//                       },
//                     ),
//                     CustomButton(
//                       margin: EdgeInsets.only(top: 36.h),
//                       borderRadius: BorderRadius.circular(8.r),
//                       Color: Kform_border_twg,
//                       textColor: Kwhite,
//                       height: 40,
//                       width: 200.w,
//                       label: "Set White Colour",
//                       fontSize: kSixteenFont,
//                       fontWeight: kFW700,
//                       isLoading: false,
//                       onTap: () async {
//                         controller.add(
//                           CustomCanvasItem(
//                             child: Container(
//                               color: Kwhite,
//                             ),
//                             canvasConfig: CanvasConfig(
//                               size: const Size(600, 600),
//                               transform: Matrix4.identity(),
//                               allowUserInteraction: true,
//                             ),
//                           ),
//                         );
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     CustomButtonGradientOutlined(
//                       margin: EdgeInsets.only(top: 20.h),
//                       label: "Add +",
//                       isLoading: false,
//                       height: 40,
//                       width: 200.w,
//                       fontSize: kSixteenFont,
//                       textColor: KBlack_twg,
//                       fontWeight: kFW500,
//                       Padding:
//                           EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                       onTap: () {
//                         controller.add(
//                           CustomCanvasItem(
//                             child: Container(
//                               color: _containerColor,
//                             ),
//                             canvasConfig: CanvasConfig(
//                               size: const Size(600, 600),
//                               transform: Matrix4.identity(),
//                               allowUserInteraction: true,
//                             ),
//                           ),
//                         );
//                         Navigator.of(context).pop();
//                       },
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _openDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.all(0),
//           contentPadding: EdgeInsets.zero,
//           title: Text(
//             'Custom text',
//             style: GoogleFonts.poppins(
//                 color: Kform_border_twg,
//                 fontSize: kTwentyFont,
//                 fontWeight: kFW500),
//           ),
//           content: Container(
//             width: double.maxFinite,
//             margin: EdgeInsets.only(left: 3.w, right: 3.w),
//             child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         CustomFormFields(
//                           readOnly: true,
//                           ontap: () {
//                             _focusNode.unfocus();
//                           },
//                           focusNode: _focusNode,
//                           controller: _textController,
//                           enabled: true,
//                           labelColor: KText,
//                           obscureText: false,
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 8),
//                           fontSize: kFourteenFont,
//                           fontWeight: FontWeight.w500,
//                           hintText: "Enter Text in keyboard",
//                           maxLines: 1,
//                           label: "",
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter Text';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Slider(
//                           label: 'Font Size',
//                           value: _fontSize,
//                           min: 16,
//                           max: 50,
//                           onChanged: (value) {
//                             setState(() {
//                               _fontSize = value;
//                             });
//                           },
//                         ),
//                         CustomButton(
//                           margin: EdgeInsets.only(top: 20.h),
//                           borderRadius: BorderRadius.circular(8.r),
//                           Color: Kform_border_twg,
//                           textColor: Kwhite,
//                           height: 40,
//                           width: 200.w,
//                           label: "Select Colour",
//                           fontSize: kSixteenFont,
//                           fontWeight: kFW700,
//                           isLoading: false,
//                           onTap: () async {
//                             Color? color = await showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: const Text('Pick Text Color'),
//                                   content: SingleChildScrollView(
//                                     child: ColorPicker(
//                                       pickerColor: _textColor,
//                                       onColorChanged: (color) =>
//                                           _textColor = color,
//                                       showLabel: false,
//                                     ),
//                                   ),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       child: const Text('Got it'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop(_textColor);
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                             if (color != null) {
//                               setState(() {
//                                 _textColor = color;
//                               });
//                             }
//                           },
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 20.h),
//                           width: 200,
//                           height: 40,
//                           padding: EdgeInsets.symmetric(horizontal: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Colors.grey),
//                           ),
//                           child: DropdownButton<String>(
//                             value: _fontFamily,
//                             isExpanded: true,
//                             underline: SizedBox(),
//                             items: <String>[
//                               'Roboto',
//                               'Lobster',
//                               'Pacifico',
//                               'Poppins'
//                             ]
//                                 .map((String value) => DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(value),
//                                     ))
//                                 .toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 _fontFamily = value!;
//                               });
//                             },
//                           ),
//                         ),
//                         CustomButtonGradientOutlined(
//                           margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
//                           label: "Add +",
//                           isLoading: false,
//                           height: 40,
//                           width: 200.w,
//                           fontSize: kSixteenFont,
//                           textColor: KBlack_twg,
//                           onTap: _addTextOverlay,
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: OnscreenKeyboard(
//                         value: '',
//                         backgroundColor: Kwhite,
//                         buttonColor: Colors.amber,
//                         focusColor: Colors.red,
//                         onChanged: (txt) {
//                           setState(() {
//                             _textController.text = txt!;
//                           });
//                         },
//                         initialCase: InitialCase.LOWER_CASE,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       dashboardcontroller.isFormselected.value = false;
//     });
//     _focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   void _addTextOverlay() {
//     String text = _textController.text;
//     if (text.isNotEmpty) {
//       CustomCanvasItem textOverlay = CustomCanvasItem(
//         child: Container(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: _textColor,
//               fontSize: _fontSize,
//               fontFamily: _fontFamily,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         canvasConfig: CanvasConfig(
//           size: Size(text.length * _fontSize, _fontSize * 2),
//           transform: Matrix4.identity(),
//           allowUserInteraction: true,
//         ),
//       );

//       controller.add(textOverlay);
//       Navigator.of(context).pop();
//       _textController.clear();
//     }
//   }

//   Future<void> _downloadImage() async {
//     try {
//       RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;
//       final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       final ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       final Uint8List pngBytes = byteData!.buffer.asUint8List();

//       // Get the directory to save the file
//       final directory = await getApplicationDocumentsDirectory();
//       final String filePath = '${directory.path}/capturedFile.png';
//       final File file = File(filePath);

//       // Save the image as a file
//       await file.writeAsBytes(pngBytes);

//       // Show dialog with captured image and file details
//       showDialog<void>(
//         context: context,
//         builder: (_) => Dialog(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: const Text(
//                   'Captured Image',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Image.memory(pngBytes),
//               // const SizedBox(height: 10),
//               // Text(
//               //   'File saved at: $filePath',
//               //   textAlign: TextAlign.center,
//               //   style: const TextStyle(fontSize: 14),
//               // ),
//             ],
//           ),
//         ),
//       );
//     } catch (e) {
//       _showAlertDialog(
//         title: 'Error',
//         content: 'Failed to capture and save image: ${e.toString()}',
//       );
//     }
//   }

//   // Future<void> _downloadImage() async {
//   //   try {
//   //     RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
//   //         .findRenderObject() as RenderRepaintBoundary;
//   //     final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//   //     final ByteData? byteData =
//   //         await image.toByteData(format: ui.ImageByteFormat.png);
//   //     final Uint8List pngBytes = byteData!.buffer.asUint8List();

//   //     showDialog<void>(
//   //       context: context,
//   //       builder: (_) => Dialog(
//   //         child: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Padding(
//   //               padding: const EdgeInsets.all(16.0),
//   //               child: const Text('Captured Image',
//   //                   style:
//   //                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//   //             ),
//   //             Image.memory(pngBytes),
//   //           ],
//   //         ),
//   //       ),
//   //     );
//   //   } catch (e) {
//   //     _showAlertDialog(
//   //       title: 'Error',
//   //       content: 'Failed to capture image: ${e.toString()}',
//   //     );
//   //   }
//   // }

//   void _showAlertDialog({required String title, required String content}) {
//     showDialog<void>(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('OK'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _addImageOverlay() async {
//     final imagePick = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 100,
//     );

//     if (imagePick == null) return;

//     final imageBytes = await imagePick.readAsBytes();
//     _imageData = Uint8List.fromList(imageBytes);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.all(0),
//           contentPadding: EdgeInsets.zero,
//           title: const Text('Crop Image'),
//           content: SizedBox(
//             width: double.maxFinite,
//             child: Crop(
//               image: _imageData,
//               controller: cropController,
//               aspectRatio: 4 / 3,
//               baseColor: Colors.blue.shade900,
//               maskColor: Colors.white.withAlpha(100),
//               radius: 20,
//               onCropped: (croppedData) async {
//                 Navigator.of(context).pop();
//                 final img_lib.Image? croppedImage =
//                     img_lib.decodeImage(croppedData);
//                 if (croppedImage != null) {
//                   final imageBytes = img_lib.encodePng(croppedImage);

//                   controller.add(
//                     TransparentBgImageCanvasItem(
//                       image: croppedImage,
//                       imageBytes: imageBytes,
//                       canvasConfig: CanvasConfig(
//                         size: Size(croppedImage.width.toDouble(),
//                             croppedImage.height.toDouble()),
//                         transform: Matrix4.identity(),
//                         allowUserInteraction: true,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 cropController.crop();
//               },
//               child: const Text('Done'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 final img_lib.Image? originalImage =
//                     img_lib.decodeImage(_imageData);
//                 if (originalImage != null) {
//                   final originalImageBytes = img_lib.encodePng(originalImage);

//                   controller.add(
//                     TransparentBgImageCanvasItem(
//                       image: originalImage,
//                       imageBytes: originalImageBytes,
//                       canvasConfig: CanvasConfig(
//                         size: Size(originalImage.width.toDouble(),
//                             originalImage.height.toDouble()),
//                         transform: Matrix4.identity(),
//                         allowUserInteraction: true,
//                       ),
//                     ),
//                   );
//                 }

//                 Navigator.of(context).pop();
//               },
//               child: const Text('Skip'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//           elevation: 3,
//           shadowColor: kblack,
//           backgroundColor: Kblue_twg,
//           automaticallyImplyLeading: false,
//           titleSpacing: 0,
//           leading: InkWell(
//             onTap: () {
//               Get.back();
//               Get.back();
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Kwhite,
//               size: 23.sp,
//             ),
//           ),
//           title: Text(
//             "Create Banner",
//             style: GoogleFonts.poppins(
//                 color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
//           )),

//       body:
//           // selectedData
//           selectedData == "landscape"
//               ? Center(
//                   child: RepaintBoundary(
//                     key: _repaintBoundaryKey,
//                     child: Container(
//                       margin: EdgeInsets.only(
//                           left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
//                       height: screenSize.height, // Full screen height
//                       width: screenSize.width, // Full screen width
//                       child: LayoutBuilder(
//                         builder: (context, constraints) {
//                           // For Facebook landscape post dimensions (1.91:1 aspect ratio)
//                           double artBoardWidth = constraints.maxWidth;
//                           double artBoardHeight = artBoardWidth /
//                               1.91; // Aspect ratio 1.91:1 for Facebook

//                           // Optionally, you can switch between landscape and square posts:
//                           // For square posts, uncomment below lines and comment out the landscape post dimensions
//                           // double artBoardWidth = constraints.maxWidth;
//                           // double artBoardHeight = artBoardWidth; // 1:1 aspect ratio for square posts

//                           return StackArtBoard(
//                             stackArtBoardKey: UniqueKey(),
//                             controller: controller,
//                             artBoardConfig: ArtBoardConfig(
//                               containerSize: Size(
//                                   constraints.maxWidth, constraints.maxHeight),
//                               artBoardSize: Size(artBoardWidth,
//                                   artBoardHeight), // Apply Facebook post dimensions
//                               toolIconWidth: 20,
//                               borderWidth: 5,
//                               borderColor: Colors.black,
//                               rotateWidget: Container(
//                                 color: Colors.orange,
//                                 child: Icon(
//                                   Icons.rotate_left,
//                                   size: 18,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               deleteWidget: Container(
//                                 color: Colors.pink,
//                                 child: Icon(
//                                   Icons.clear,
//                                   size: 18,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             background:
//                                 Container(color: kblack.withOpacity(0.7)),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 )
//               : selectedData == "square"
//                   ? Center(
//                       child: RepaintBoundary(
//                         key: _repaintBoundaryKey,
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
//                           height: MediaQuery.of(context).size.height,
//                           width: MediaQuery.of(context).size.width,
//                           child: LayoutBuilder(
//                             builder: (context, constraints) {
//                               // For LinkedIn landscape post dimensions (1.91:1 aspect ratio)
//                               // double artBoardWidth = constraints.maxWidth;
//                               // double artBoardHeight = constraints.maxWidth / 1.91;

//                               // // Or use square LinkedIn post (1:1 aspect ratio)
//                               double artBoardWidth = constraints.maxWidth;
//                               double artBoardHeight = constraints.maxWidth;

//                               return StackArtBoard(
//                                 stackArtBoardKey: UniqueKey(),
//                                 controller: controller,
//                                 artBoardConfig: ArtBoardConfig(
//                                   containerSize: Size(constraints.maxWidth,
//                                       constraints.maxHeight),
//                                   artBoardSize:
//                                       Size(artBoardWidth, artBoardHeight),
//                                   toolIconWidth: 20,
//                                   borderWidth: 5,
//                                   borderColor: Colors.black,
//                                   rotateWidget: Container(
//                                     color: Colors.orange,
//                                     child: Icon(
//                                       Icons.rotate_left,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   deleteWidget: Container(
//                                     color: Colors.pink,
//                                     child: Icon(
//                                       Icons.clear,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 background:
//                                     Container(color: kblack.withOpacity(0.7)),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: RepaintBoundary(
//                       key: _repaintBoundaryKey,
//                       child: Container(
//                         margin: EdgeInsets.only(
//                             left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
//                         height: MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context).size.width,
//                         child: LayoutBuilder(
//                           builder: (context, constraints) {
//                             return StackArtBoard(
//                               stackArtBoardKey: UniqueKey(),
//                               controller: controller,
//                               artBoardConfig: ArtBoardConfig(
//                                 containerSize: Size(constraints.maxWidth,
//                                     constraints.maxHeight),
//                                 artBoardSize: Size(constraints.maxWidth * 1.5,
//                                     constraints.maxHeight * 1.5),
//                                 toolIconWidth: 20,
//                                 borderWidth: 5,
//                                 borderColor: Colors.black,
//                                 rotateWidget: Container(
//                                   color: Colors.orange,
//                                   child: Icon(
//                                     Icons.rotate_left,
//                                     size: 18,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 deleteWidget: Container(
//                                   color: Colors.pink,
//                                   child: Icon(
//                                     Icons.clear,
//                                     size: 18,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               background:
//                                   Container(color: kblack.withOpacity(0.7)),
//                             );
//                           },
//                         ),
//                       ),
//                     )),
//       // instagram below

//       // Center(
//       //   child: RepaintBoundary(
//       //     key: _repaintBoundaryKey,
//       //     child: Container(
//       //       margin: EdgeInsets.only(
//       //           left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
//       //       // Set a specific height and width based on Instagram's square post ratio (1:1)
//       //       height: screenSize
//       //           .width, // Using screen width for square aspect ratio (1:1)
//       //       width: screenSize
//       //           .width, // Using screen width for square aspect ratio (1:1)
//       //       child: LayoutBuilder(
//       //         builder: (context, constraints) {
//       //           return StackArtBoard(
//       //             stackArtBoardKey: UniqueKey(),
//       //             controller: controller,
//       //             artBoardConfig: ArtBoardConfig(
//       //               containerSize:
//       //                   Size(constraints.maxWidth, constraints.maxHeight),
//       //               artBoardSize: Size(
//       //                 constraints.maxWidth * 1.5,
//       //                 constraints.maxHeight * 1.5,
//       //               ),
//       //               toolIconWidth: 20,
//       //               borderWidth: 5,
//       //               borderColor: Colors.black,
//       //               rotateWidget: Container(
//       //                 color: Colors.orange,
//       //                 child: Icon(
//       //                   Icons.rotate_left,
//       //                   size: 18,
//       //                   color: Colors.white,
//       //                 ),
//       //               ),
//       //               deleteWidget: Container(
//       //                 color: Colors.pink,
//       //                 child: Icon(
//       //                   Icons.clear,
//       //                   size: 18,
//       //                   color: Colors.white,
//       //                 ),
//       //               ),
//       //             ),
//       //             background: Container(color: kblack.withOpacity(0.7)),
//       //           );
//       //         },
//       //       ),
//       //     ),
//       //   ),
//       // ),

//       // Center(
//       //     child: RepaintBoundary(
//       //   key: _repaintBoundaryKey,
//       //   child: Container(
//       //     margin:
//       //         EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
//       //     height: MediaQuery.of(context).size.height,
//       //     width: MediaQuery.of(context).size.width,
//       //     child: LayoutBuilder(
//       //       builder: (context, constraints) {
//       //         return StackArtBoard(
//       //           stackArtBoardKey: UniqueKey(),
//       //           controller: controller,
//       //           artBoardConfig: ArtBoardConfig(
//       //             containerSize:
//       //                 Size(constraints.maxWidth, constraints.maxHeight),
//       //             artBoardSize: Size(
//       //                 constraints.maxWidth * 1.5, constraints.maxHeight * 1.5),
//       //             toolIconWidth: 20,
//       //             borderWidth: 5,
//       //             borderColor: Colors.black,
//       //             rotateWidget: Container(
//       //               color: Colors.orange,
//       //               child: Icon(
//       //                 Icons.rotate_left,
//       //                 size: 18,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //             deleteWidget: Container(
//       //               color: Colors.pink,
//       //               child: Icon(
//       //                 Icons.clear,
//       //                 size: 18,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ),
//       //           background: Container(color: kblack.withOpacity(0.7)),
//       //         );
//       //       },
//       //     ),
//       //   ),
//       // )),

//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SizedBox(
//             width: 10,
//           ),
//           InkWell(
//             onTap: () {
//               _openContainerDialog();
//             },
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 color: kblack,
//               ),
//               child: Icon(
//                 Icons.filter_frames,
//                 size: 24,
//                 color: Kwhite,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: _openDialog,
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 color: kblack,
//               ),
//               child: Icon(
//                 Icons.abc,
//                 size: 24,
//                 color: Kwhite,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: _addImageOverlay,
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 color: kblack,
//               ),
//               child: Icon(
//                 Icons.image,
//                 size: 24,
//                 color: Kwhite,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               controller.moveToTop();
//             },
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 color: kblack,
//               ),
//               child: Icon(
//                 Icons.keyboard_arrow_up,
//                 size: 24,
//                 color: Kwhite,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               controller.moveToBottom();
//             },
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 color: kblack,
//               ),
//               child: Icon(
//                 Icons.keyboard_arrow_down,
//                 size: 24,
//                 color: Kwhite,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               _downloadImage();
//             },
//             child: Container(
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 color: kblack,
//               ),
//               child: Icon(
//                 Icons.file_download,
//                 size: 24,
//                 color: Kwhite,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'dart:typed_data';
// import 'package:image/image.dart' as img_lib;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:crop_your_image/crop_your_image.dart';
// import 'package:stack_art_board/stack_art_board.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final StackArtBoardController controller = StackArtBoardController();
//   final CropController cropController = CropController();
//   Uint8List _imageData = Uint8List(0); // Ensures correct type for image data
//   double _fontSize = 20;
//   Color _textColor = Colors.black;
//   String _fontFamily = 'Roboto';
//   TextEditingController _textController = TextEditingController();

//   // Keyboard actions configuration
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode(); // Initialize FocusNode for text field
//   }

//   @override
//   void dispose() {
//     _focusNode
//         .dispose(); // Dispose of the FocusNode when the widget is disposed
//     super.dispose();
//   }

//   // Add text overlay to the canvas
//   void _addTextOverlay() {
//     String text = _textController.text;
//     if (text.isNotEmpty) {
//       // Create a new CustomCanvasItem for the text overlay
//       CustomCanvasItem textOverlay = CustomCanvasItem(
//         child: Container(
//           padding: const EdgeInsets.all(8.0),
//           color: Colors.black.withOpacity(0.3),
//           child: Text(
//             text,
//             style: TextStyle(
//               color: _textColor,
//               fontSize: _fontSize,
//               fontFamily: _fontFamily,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         canvasConfig: CanvasConfig(
//           size: Size(text.length * _fontSize, _fontSize * 2),
//           transform: Matrix4.identity(),
//           allowUserInteraction: true,
//         ),
//       );

//       // Add the new text overlay to the controller
//       controller.add(textOverlay);
//       // Clear text field after adding
//       _textController.clear();
//     }
//   }

//   // Add image overlay (with cropping)
//   Future<void> _addImageOverlay() async {
//     final imagePick = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 100,
//     );

//     if (imagePick == null) return;

//     final imageBytes = await imagePick.readAsBytes();
//     _imageData = Uint8List.fromList(imageBytes);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.all(0),
//           contentPadding: EdgeInsets.zero, // Remove outer padding
//           title: const Text('Crop Image'),
//           content: SizedBox(
//             width: double
//                 .maxFinite, // Ensure the crop widget takes up all available width
//             child: Crop(
//               image: _imageData,
//               controller: cropController,
//               aspectRatio: 4 / 3,
//               baseColor: Colors.blue.shade900,
//               maskColor: Colors.white.withAlpha(100),
//               radius: 20,
//               onCropped: (croppedData) async {
//                 // Crop operation is done, handle the cropped data here
//                 Navigator.of(context).pop(); // Close the dialog
//                 final img_lib.Image? croppedImage =
//                     img_lib.decodeImage(croppedData);
//                 if (croppedImage != null) {
//                   final imageBytes = img_lib.encodePng(croppedImage);

//                   // Add the cropped image as an overlay to the StackArtBoard
//                   controller.add(
//                     TransparentBgImageCanvasItem(
//                       image: croppedImage,
//                       imageBytes: imageBytes,
//                       canvasConfig: CanvasConfig(
//                         size: Size(
//                           croppedImage.width.toDouble(),
//                           croppedImage.height.toDouble(),
//                         ),
//                         transform: Matrix4.identity(),
//                         allowUserInteraction: true,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//           actions: <Widget>[
//             // "Done" button to confirm cropping
//             TextButton(
//               onPressed: () {
//                 // Call the crop method manually (onCropped will be triggered)
//                 cropController.crop();
//               },
//               child: const Text('Done'),
//             ),
//             // "Skip" button to skip cropping
//             TextButton(
//               onPressed: () async {
//                 // Decode the original image from _imageData
//                 final img_lib.Image? originalImage =
//                     img_lib.decodeImage(_imageData);
//                 if (originalImage != null) {
//                   final originalImageBytes = img_lib.encodePng(originalImage);

//                   // Add the original image (without cropping) as an overlay to the StackArtBoard
//                   controller.add(
//                     TransparentBgImageCanvasItem(
//                       image: originalImage, // Use the original image here
//                       imageBytes: originalImageBytes,
//                       canvasConfig: CanvasConfig(
//                         size: Size(
//                           originalImage.width.toDouble(),
//                           originalImage.height.toDouble(),
//                         ),
//                         transform: Matrix4.identity(),
//                         allowUserInteraction: true,
//                       ),
//                     ),
//                   );
//                 }

//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text('Skip'),
//             ),
//             // Optionally, add a "Cancel" button to dismiss the dialog
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .pop(); // Close the dialog without cropping
//               },
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       body: KeyboardActions(
//         config: KeyboardActionsConfig(
//           keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//           actions: [
//             KeyboardActionsItem(focusNode: _focusNode),
//           ],
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: 50),
//             // Text input field
//             TextField(
//               focusNode: _focusNode, // Assign the focus node to the text field
//               controller: _textController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter Text',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             // Font size slider
//             Slider(
//               label: 'Font Size',
//               value: _fontSize,
//               min: 16,
//               max: 50,
//               onChanged: (value) {
//                 setState(() {
//                   _fontSize = value;
//                 });
//               },
//             ),
//             // Color picker for text color
//             TextButton(
//               child: Text(
//                 "Select Text Color",
//                 style: TextStyle(color: _textColor),
//               ),
//               onPressed: () async {
//                 Color? color = await showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Pick Text Color'),
//                       content: SingleChildScrollView(
//                         child: ColorPicker(
//                           pickerColor: _textColor,
//                           onColorChanged: (color) => _textColor = color,
//                           showLabel: false,
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: const Text('Got it'),
//                           onPressed: () {
//                             Navigator.of(context).pop(_textColor);
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 if (color != null) {
//                   setState(() {
//                     _textColor = color;
//                   });
//                 }
//               },
//             ),
//             // Font family dropdown
//             DropdownButton<String>(
//               value: _fontFamily,
//               items: <String>['Roboto', 'Lobster', 'Pacifico']
//                   .map((String value) => DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _fontFamily = value!;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _addTextOverlay,
//                   child: const Text('Add Text Overlay'),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: _addImageOverlay,
//                   child: const Text('Add Image Overlay'),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 300,
//               width: 300,
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   // Ensure Layout is ready
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     // Once layout is complete, interact with StackArtBoard
//                   });

//                   return Container(
//                     width: constraints.maxWidth,
//                     height: constraints.maxHeight,
//                     child: StackArtBoard(
//                       stackArtBoardKey: UniqueKey(),
//                       controller: controller,
//                       artBoardConfig: ArtBoardConfig(
//                         containerSize:
//                             Size(constraints.maxWidth, constraints.maxHeight),
//                         artBoardSize: Size(constraints.maxWidth * 1.5,
//                             constraints.maxHeight * 1.5),
//                         toolIconWidth: 20,
//                         borderWidth: 5,
//                         borderColor: Colors.black,
//                         rotateWidget: Container(color: Colors.orange),
//                         deleteWidget: Container(
//                           color: Colors.pink,
//                           child: Icon(
//                             Icons.clear,
//                             size: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       background: Container(color: Colors.green),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:twg/untils/export_file.dart';

/////////////////////////////////////////////////////////////

// import 'dart:typed_data';
// import 'package:image/image.dart' as img_lib;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:crop_your_image/crop_your_image.dart';
// import 'package:stack_art_board/stack_art_board.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:keyboard_actions/keyboard_actions.dart'; // Import keyboard actions package

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final StackArtBoardController controller = StackArtBoardController();
//   final CropController cropController = CropController();
//   Uint8List _imageData = Uint8List(0); // Ensures correct type for image data
//   double _fontSize = 20;
//   Color _textColor = Colors.black;
//   String _fontFamily = 'Roboto';
//   TextEditingController _textController = TextEditingController();

//   // Keyboard actions configuration
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode(); // Initialize FocusNode for text field
//   }

//   @override
//   void dispose() {
//     _focusNode
//         .dispose(); // Dispose of the FocusNode when the widget is disposed
//     super.dispose();
//   }

//   // Add text overlay to the canvas
//   void _addTextOverlay() {
//     String text = _textController.text;
//     if (text.isNotEmpty) {
//       // Create a new CustomCanvasItem for the text overlay
//       CustomCanvasItem textOverlay = CustomCanvasItem(
//         child: Container(
//           padding: const EdgeInsets.all(8.0),
//           color: Colors.black.withOpacity(0.3),
//           child: Text(
//             text,
//             style: TextStyle(
//               color: _textColor,
//               fontSize: _fontSize,
//               fontFamily: _fontFamily,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         canvasConfig: CanvasConfig(
//           size: Size(text.length * _fontSize, _fontSize * 2),
//           transform: Matrix4.identity(),
//           allowUserInteraction: true,
//         ),
//       );

//       // Add the new text overlay to the controller
//       controller.add(textOverlay);
//       // Clear text field after adding
//       _textController.clear();
//     }
//   }

//   // Add image overlay (with cropping)
//   Future<void> _addImageOverlay() async {
//     final imagePick = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 100,
//     );

//     if (imagePick == null) return;

//     final imageBytes = await imagePick.readAsBytes();
//     _imageData = Uint8List.fromList(imageBytes);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           insetPadding: EdgeInsets.all(0),
//           contentPadding: EdgeInsets.zero, // Remove outer padding
//           title: const Text('Crop Image'),
//           content: SizedBox(
//             width: double
//                 .maxFinite, // Ensure the crop widget takes up all available width
//             child: Crop(
//               image: _imageData,
//               controller: cropController,
//               aspectRatio: 4 / 3,
//               baseColor: Colors.blue.shade900,
//               maskColor: Colors.white.withAlpha(100),
//               radius: 20,
//               onCropped: (croppedData) async {
//                 // Crop operation is done, handle the cropped data here
//                 Navigator.of(context).pop(); // Close the dialog
//                 final img_lib.Image? croppedImage =
//                     img_lib.decodeImage(croppedData);
//                 if (croppedImage != null) {
//                   final imageBytes = img_lib.encodePng(croppedImage);

//                   // Add the cropped image as an overlay to the StackArtBoard
//                   controller.add(
//                     TransparentBgImageCanvasItem(
//                       image: croppedImage,
//                       imageBytes: imageBytes,
//                       canvasConfig: CanvasConfig(
//                         size: Size(
//                           croppedImage.width.toDouble(),
//                           croppedImage.height.toDouble(),
//                         ),
//                         transform: Matrix4.identity(),
//                         allowUserInteraction: true,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//           actions: <Widget>[
//             // "Done" button to confirm cropping
//             TextButton(
//               onPressed: () {
//                 // Call the crop method manually (onCropped will be triggered)
//                 cropController.crop();
//               },
//               child: const Text('Done'),
//             ),
//             // "Skip" button to skip cropping
//             TextButton(
//               onPressed: () async {
//                 // Decode the original image from _imageData
//                 final img_lib.Image? originalImage =
//                     img_lib.decodeImage(_imageData);
//                 if (originalImage != null) {
//                   final originalImageBytes = img_lib.encodePng(originalImage);

//                   // Add the original image (without cropping) as an overlay to the StackArtBoard
//                   controller.add(
//                     TransparentBgImageCanvasItem(
//                       image: originalImage, // Use the original image here
//                       imageBytes: originalImageBytes,
//                       canvasConfig: CanvasConfig(
//                         size: Size(
//                           originalImage.width.toDouble(),
//                           originalImage.height.toDouble(),
//                         ),
//                         transform: Matrix4.identity(),
//                         allowUserInteraction: true,
//                       ),
//                     ),
//                   );
//                 }

//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text('Skip'),
//             ),
//             // Optionally, add a "Cancel" button to dismiss the dialog
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .pop(); // Close the dialog without cropping
//               },
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stack Art Board Demo'),
//       ),
//       body: KeyboardActions(
//         config: KeyboardActionsConfig(
//           keyboardActionsPlatform: KeyboardActionsPlatform.ALL,

//           actions: [
//             KeyboardActionsItem(
//               focusNode: _focusNode,
//             ),
//             // KeyboardAction(
//             //   focusNode: _focusNode, // Focus node for text field
//             //   toolbarButtons: [
//             //     (node) {
//             //       return IconButton(
//             //         icon: Icon(Icons.close),
//             //         onPressed: () {
//             //           node.unfocus();
//             //         },
//             //       );
//             //     }
//             //   ],
//             // ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               // Text input field
//               TextField(
//                 focusNode:
//                     _focusNode, // Assign the focus node to the text field
//                 controller: _textController,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter Text',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Font size slider
//               Slider(
//                 label: 'Font Size',
//                 value: _fontSize,
//                 min: 16,
//                 max: 50,
//                 onChanged: (value) {
//                   setState(() {
//                     _fontSize = value;
//                   });
//                 },
//               ),
//               // Color picker for text color
//               TextButton(
//                 child: Text(
//                   "Select Text Color",
//                   style: TextStyle(color: _textColor),
//                 ),
//                 onPressed: () async {
//                   Color? color = await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Pick Text Color'),
//                         content: SingleChildScrollView(
//                           child: ColorPicker(
//                             pickerColor: _textColor,
//                             onColorChanged: (color) => _textColor = color,
//                             showLabel: false,
//                           ),
//                         ),
//                         actions: <Widget>[
//                           TextButton(
//                             child: const Text('Got it'),
//                             onPressed: () {
//                               Navigator.of(context).pop(_textColor);
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                   if (color != null) {
//                     setState(() {
//                       _textColor = color;
//                     });
//                   }
//                 },
//               ),
//               // Font family dropdown
//               DropdownButton<String>(
//                 value: _fontFamily,
//                 items: <String>['Roboto', 'Lobster', 'Pacifico']
//                     .map((String value) => DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _fontFamily = value!;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _addTextOverlay,
//                     child: const Text('Add Text Overlay'),
//                   ),
//                   SizedBox(width: 20),
//                   ElevatedButton(
//                     onPressed: _addImageOverlay,
//                     child: const Text('Add Image Overlay'),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: StackArtBoard(
//                   stackArtBoardKey: UniqueKey(),
//                   controller: controller,
//                   artBoardConfig: ArtBoardConfig(
//                     containerSize: screenSize,
//                     artBoardSize:
//                         Size(screenSize.width * 3, screenSize.height * 3),
//                     toolIconWidth: 20,
//                     borderWidth: 5,
//                     borderColor: Colors.black,
//                     rotateWidget: Container(color: Colors.orange),
//                     deleteWidget: Container(
//                       color: Colors.pink, // Adjusted color here
//                       child: Icon(
//                         Icons.clear,
//                         size: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   background: Container(color: Colors.green),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// try ing out above
/////////////////////////////////
/////////////////////////////////////////////
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img_lib;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:stack_art_board/stack_art_board.dart';
// import 'package:twg/untils/constants.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final StackArtBoardController controller = StackArtBoardController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stack Art Board Demo'),
//       ),
//       body: Center(
//         child: StackArtBoard(
//           stackArtBoardKey: UniqueKey(),
//           controller: controller,
//           artBoardConfig: ArtBoardConfig(
//             containerSize: const Size(300, 300),
//             artBoardSize: const Size(3000, 3000),
//             toolIconWidth: 20,
//             borderWidth: 5,
//             borderColor: Colors.black,
//             rotateWidget: Container(color: Colors.orange),
//             deleteWidget: Container(
//               color: KDarkPink_twg,
//               child: Icon(
//                 Icons.clear,
//                 size: 18,
//                 color: Kwhite,
//               ),
//             ),
//           ),
//           background: Container(color: Colors.green),
//         ),
//       ),
//       //  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               controller.add(
//                 CustomCanvasItem(
//                   child: Container(
//                     color: Kwhite,
//                     child: const Center(
//                       child: Text('text'),
//                     ),
//                   ),
//                   canvasConfig: CanvasConfig(
//                     size: const Size(600, 600),
//                     transform: Matrix4.identity(),
//                     allowUserInteraction: true,
//                   ),
//                 ),
//               );
//             },
//             child: const Text('add custom canvas'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final imagePick = await ImagePicker().pickImage(
//                 source: ImageSource.gallery,
//                 imageQuality: 10,
//               );

//               if (imagePick == null) return;

//               // Load the image bytes directly from the file path
//               final imageBytes = await File(imagePick.path).readAsBytes();
//               final image = img_lib.decodeImage(imageBytes);
//               if (image == null) return;

//               controller.add(
//                 TransparentBgImageCanvasItem(
//                   image: image,
//                   imageBytes: imageBytes,
//                   canvasConfig: CanvasConfig(
//                     size: Size(image.width.toDouble(), image.height.toDouble()),
//                     transform: Matrix4.identity(),
//                     allowUserInteraction: true,
//                   ),
//                 ),
//               );
//             },
//             child: const Text('add transparent bg image'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               controller.moveToTop();
//             },
//             child: const Text('move to top'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               controller.moveToBottom();
//             },
//             child: const Text('move to bottom'),
//           ),
//         ],
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////////above is stack board code
// import 'package:awesome_gallery_saver/gallery_saver.dart';
// below is for datack board
// import 'package:expandable_section/expandable_section.dart';
// import 'package:flutter/rendering.dart';
// import 'package:image_editor_plus/image_editor_plus.dart';
// import 'package:image_editor_plus/options.dart';
// import 'package:twg/untils/export_file.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:stack_board/flutter_stack_board.dart';
// import 'package:stack_board/stack_board_item.dart';
// import 'package:stack_board/stack_case.dart';
// import 'package:stack_board/stack_items.dart';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';

// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';

// class ColorContent extends StackItemContent {
//   ColorContent({required this.color});
//   Color color;

//   @override
//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{'color': color.value};
//   }
// }

// class ColorStackItem extends StackItem<ColorContent> {
//   ColorStackItem({
//     required Size size,
//     String? id,
//     Offset? offset,
//     double? angle,
//     StackItemStatus? status,
//     ColorContent? content,
//   }) : super(
//           id: id,
//           size: size,
//           offset: offset,
//           angle: angle,
//           status: status,
//           content: content,
//           lockZOrder: true,
//         );

//   @override
//   ColorStackItem copyWith({
//     Size? size,
//     Offset? offset,
//     double? angle,
//     StackItemStatus? status,
//     bool? lockZOrder,
//     ColorContent? content,
//   }) {
//     return ColorStackItem(
//       id: id,
//       size: size ?? this.size,
//       offset: offset ?? this.offset,
//       angle: angle ?? this.angle,
//       status: status ?? this.status,
//       content: content ?? this.content,
//     );
//   }
// }

// class EditProfile extends StatefulWidget {
//   const EditProfile({Key? key}) : super(key: key);

//   @override
//   _EditProfileState createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   ////
//   late StackBoardController _boardController;
//   final GlobalKey _repaintBoundaryKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     _boardController = StackBoardController();
//   }

//   @override
//   void dispose() {
//     _boardController.dispose();
//     super.dispose();
//   }

//   void _downloadImage() async {
//     try {
//       RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;
//       final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       final ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       final Uint8List pngBytes = byteData!.buffer.asUint8List();

//       showDialog<void>(
//         context: context,
//         builder: (_) => Dialog(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: const Text('Captured Image',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ),
//               Image.memory(pngBytes),
//             ],
//           ),
//         ),
//       );
//     } catch (e) {
//       _showAlertDialog(
//         title: 'Error',
//         content: 'Failed to capture image: ${e.toString()}',
//       );
//     }
//   }

//   Future<void> _onDel(StackItem<StackItemContent> item) async {
//     final bool? confirmDelete = await showDialog<bool>(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: const Text('Confirm Deletion'),
//           content: const Text('Are you sure you want to delete this item?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, true),
//               child: const Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, false),
//               child: const Text('No'),
//             ),
//           ],
//         );
//       },
//     );

//     if (confirmDelete == true) {
//       _boardController.removeById(item.id);
//     }
//   }

//   void _addTextItem() {
//     _boardController.addItem(
//       StackTextItem(
//         size: const Size(200, 100),
//         content: TextItemContent(data: 'Sample Text'),
//       ),
//     );
//   }

//   void _addImageItem() {
//     _boardController.addItem(
//       StackImageItem(
//         size: Size(300, 85),
//         content: ImageItemContent(
//           url:
//               'https://files.flutter-io.cn/images/branding/flutterlogo/flutter-cn-logo.png',
//         ),
//       ),
//     );
//   }

//   void _addDrawItem() {
//     _boardController.addItem(StackDrawItem(size: const Size.square(300)));
//   }

//   void _addCustomItem() {
//     final Color color =
//         Colors.primaries[Random().nextInt(Colors.primaries.length)];
//     _boardController.addItem(
//       ColorStackItem(
//         size: const Size.square(100),
//         content: ColorContent(color: color),
//       ),
//     );
//   }

//   Future<void> _generateFromJson() async {
//     final String jsonString =
//         (await Clipboard.getData(Clipboard.kTextPlain))?.text ?? '';
//     if (jsonString.isEmpty) {
//       _showAlertDialog(
//           title: 'Clipboard is empty',
//           content: 'Please copy the JSON string to the clipboard first');
//       return;
//     }
//     try {
//       final List<dynamic> items = jsonDecode(jsonString) as List<dynamic>;

//       for (final dynamic item in items) {
//         if (item['type'] == 'StackTextItem') {
//           _boardController.addItem(
//             StackTextItem.fromJson(item),
//           );
//         } else if (item['type'] == 'StackImageItem') {
//           _boardController.addItem(
//             StackImageItem.fromJson(item),
//           );
//         } else if (item['type'] == 'StackDrawItem') {
//           _boardController.addItem(
//             StackDrawItem.fromJson(item),
//           );
//         }
//       }
//     } catch (e) {
//       _showAlertDialog(title: 'Error', content: e.toString());
//     }
//   }

//   Future<void> _getJson() async {
//     final String json = jsonEncode(_boardController.getAllData());
//     Clipboard.setData(ClipboardData(text: json));
//     _showAlertDialog(
//         title: 'JSON Copied',
//         content: 'JSON data has been copied to clipboard.');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Kwhite,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Kwhite,
//         title: const Text('Paint Board Screen'),
//       ),
//       body: RepaintBoundary(
//         key: _repaintBoundaryKey,
//         child: StackBoard(
//           onDel: _onDel,
//           controller: _boardController,
//           caseStyle: const CaseStyle(
//             buttonBorderColor: Colors.grey,
//             buttonIconColor: Colors.grey,
//           ),
//           background: ColoredBox(color: Kwhite),
//           customBuilder: (StackItem<StackItemContent> item) {
//             if (item is StackTextItem) {
//               return StackTextCase(item: item);
//             } else if (item is StackDrawItem) {
//               return StackDrawCase(item: item);
//             } else if (item is StackImageItem) {
//               return StackImageCase(item: item);
//             } else if (item is ColorStackItem) {
//               return Container(
//                 width: item.size.width,
//                 height: item.size.height,
//                 color: item.content?.color,
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(left: 22.w),
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//                 onPressed: _addTextItem, child: const Icon(Icons.border_color)),
//           ),
//           SizedBox(
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//                 onPressed: _addImageItem, child: const Icon(Icons.image)),
//           ),
//           SizedBox(
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//                 onPressed: _addDrawItem, child: const Icon(Icons.color_lens)),
//           ),
//           SizedBox(
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//                 onPressed: _addCustomItem, child: const Icon(Icons.add_box)),
//           ),
//           SizedBox(
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//               // onPressed: () => _boardController.clear(),
//               onPressed: () async {
//                 await showDialog<bool>(
//                   context: context,
//                   builder: (_) {
//                     return AlertDialog(
//                       title: const Text('Confirm Deletion'),
//                       content:
//                           const Text('Are you sure you want to delete Board ?'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             _boardController.clear();
//                             Get.back();
//                           },
//                           // onPressed: () => Navigator.pop(context, true),
//                           child: const Text('Yes'),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.pop(context, false),
//                           child: const Text('No'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: const Icon(Icons.delete),
//             ),
//           ),
//           //

//           SizedBox(
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//               onPressed: _downloadImage,
//               child: const Icon(Icons.file_download),
//             ),
//           ),
//           SizedBox(
//             width: 40,
//             height: 40,
//             child: FloatingActionButton(
//               onPressed: _generateFromJson,
//               child: const Icon(Icons.file_upload),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showAlertDialog({required String title, required String content}) {
//     showDialog<void>(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(content),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// above is for stack board
///////////////////////Edit Profile

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   Uint8List? imageData;

//   @override
//   void initState() {
//     super.initState();
//     loadAsset("image.jpg");
//   }

//   void loadAsset(String name) async {
//     var data = await rootBundle.load('assets/images/tshirts.jpeg');
//     setState(() => imageData = data.buffer.asUint8List());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image Editor"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (imageData != null) Image.memory(imageData!),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               child: const Text("Edit Image"),
//               onPressed: () async {
//                 var editedImage = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ImageEditor(
//                         image: imageData,
//                         cropOption: const CropOption(
//                           reversible: false,
//                         ),
//                         textOption: TextOption()),
//                   ),
//                 );

//                 // replace with edited image
//                 if (editedImage != null) {
//                   setState(() {
//                     imageData = editedImage;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController userprofilecontroller = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  String? passwordError;

  ////Password Error
  bool ispasswordcorrect = false;
  bool isbothpasswordscorrect = false;

  ///
  ///////validate password
  String? validatePassword(String password) {
    String pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);

    if (password.isEmpty) {
      setState(() {
        ispasswordcorrect = false;
      });
      return 'Password cannot be empty';
    } else if (!regExp.hasMatch(password)) {
      setState(() {
        ispasswordcorrect = false;
      });
      return 'Password must be at least 8 characters long,\ncontain uppercase, lowercase,\ndigit, and special character.';
    }
    setState(() {
      ispasswordcorrect = true;
    });
    return null;
  }

  @override
  void initState() {
    userprofilecontroller.editFirstNameController.text =
        userprofilecontroller.profileData["user_details"]["first_name"] ?? "";
    userprofilecontroller.editLastNameController.text =
        userprofilecontroller.profileData["user_details"]["last_name"] ?? "";
    userprofilecontroller.editEmailController.text =
        userprofilecontroller.profileData["user_details"]["email"] ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 2,
        cornerRadius: 20,
        snapSpec: const SnapSpec(
          initialSnap: 0.8,
          snap: true,
          snappings: [0.8, 0.81],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // KGradientPurple_twg,
                      // KGradientPink_twg,
                      Kform_border_twg,
                      Kform_border_twg
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.poppins(
                          color: Kwhite, fontSize: 32.sp, fontWeight: kFW600),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "Update Your details here.",
                      style: GoogleFonts.poppins(
                          color: Kwhite,
                          fontSize: kTenFont,
                          fontWeight: kFW400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            color: Kwhite,
            padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/horiz_divider.png",
                    height: 3.h,
                    width: 80.w,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomFormFields(
                  ontap: () {},
                  enabled: true,
                  controller: userprofilecontroller.editFirstNameController,
                  labelColor: KText,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "First Name",
                  maxLines: 1,
                  readOnly: false,
                  label: "First Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter First Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomFormFields(
                  ontap: () {
                    //  Get.toNamed(kSearchPlaces);
                  },
                  enabled: true,
                  labelColor: KText,
                  controller: userprofilecontroller.editLastNameController,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Last Name",
                  maxLines: 1,
                  readOnly: false,
                  label: "Last Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Last Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomFormFields(
                  ontap: () {
                    //  Get.toNamed(kSearchPlaces);
                  },
                  enabled: true,
                  controller: userprofilecontroller.editEmailController,
                  labelColor: KText,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Email",
                  maxLines: 1,
                  readOnly: false,
                  label: "Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 15.h,
                ),

                Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      fontSize: kSixteenFont,
                      //  letterSpacing: 1,
                      color: KBlack_twg,
                      fontWeight: kFW400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Kwhite,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Kform_border_twg,
                        controller:
                            userprofilecontroller.editPasswordController,
                        obscureText: passwordVisible,
                        obscuringCharacter: '*',
                        enabled: true,
                        readOnly: false,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: kFW500,
                          color: kblack,
                        ),
                        decoration: InputDecoration(
                          fillColor: Kwhite,
                          focusColor: Kwhite,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: passwordError == null
                                    ? KText_border_twg
                                    : KRed_twg,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: KRed_twg, width: 0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: passwordError == null
                                    ? Kform_border_twg
                                    : KRed_twg,
                                width: 1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          hintText: "Enter Password",
                          alignLabelWithHint: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20.sp,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hintStyle: GoogleFonts.poppins(
                            color: KLighText_twg,
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            passwordError = validatePassword(value);
                          });
                          setState(() {});
                        },
                      ),
                      if (passwordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            passwordError!,
                            style: TextStyle(color: KRed_twg, fontSize: 12.sp),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),

                /////////////
                ///#D2D6DE
                /////////////
                Text(
                  "Confirm Password",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      fontSize: kSixteenFont,
                      //  letterSpacing: 1,
                      color: KBlack_twg,
                      fontWeight: kFW400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Kwhite,
                  ),
                  child: TextFormField(
                    cursorColor: Kform_border_twg,
                    controller:
                        userprofilecontroller.editConfirmPasswordController,
                    obscureText: confirmpasswordVisible,
                    obscuringCharacter: '*',
                    enabled: true,
                    readOnly: false,
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp, fontWeight: kFW500, color: kblack),
                    decoration: InputDecoration(
                      focusColor: Kwhite,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: KText_border_twg, width: 0.5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: KRed_twg, width: 0.5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: KText_border_twg, width: 0.5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Kform_border_twg, width: 1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Kform_border_twg, width: 1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      fillColor: Kwhite,

                      hintText: "Enter Confirm Password",
                      alignLabelWithHint: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              confirmpasswordVisible = !confirmpasswordVisible;
                            },
                          );
                        },
                      ),
                      //make hint text
                      hintStyle: GoogleFonts.poppins(
                        color: KLighText_twg,
                        fontSize: 14.sp,
                        fontWeight: kFW400,
                      ),
                      //////////////////

                      ////////////

                      //create lable
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter ConfirmPassword';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value ==
                              userprofilecontroller
                                  .editPasswordController.text &&
                          userprofilecontroller.editPasswordController.text !=
                              "") {
                        setState(() {
                          isbothpasswordscorrect = true;
                        });
                      } else {
                        setState(() {
                          isbothpasswordscorrect = false;
                        });
                      }
                      setState(() {});
                    },
                  ),
                ),
                userprofilecontroller.editPasswordController.text == "" &&
                        userprofilecontroller
                                .editConfirmPasswordController.text ==
                            ""
                    ? CustomButton(
                        margin: EdgeInsets.only(top: 36.h),
                        borderRadius: BorderRadius.circular(8.r),
                        Color: Kform_border_twg,
                        textColor: Kwhite,
                        height: 40,
                        width: double.infinity,
                        label: "Update",
                        fontSize: kSixteenFont,
                        fontWeight: kFW700,
                        isLoading: false,
                        onTap: () {
                          var payload = {
                            "sap_user_id": userprofilecontroller
                                .profileData["user_details"]["id"],
                            // userprofilecontroller.editFirstNameController.text,
                            "sap_user_fname": userprofilecontroller
                                .editFirstNameController.text,
                            "sap_user_lname": userprofilecontroller
                                .editLastNameController.text,
                            "sap_user_email":
                                userprofilecontroller.editEmailController.text,
                          };

                          userprofilecontroller.userEditprofile(payload);
                        })
                    : CustomButton(
                        margin: EdgeInsets.only(top: 36.h),
                        borderRadius: BorderRadius.circular(8.r),
                        Color: Kform_border_twg,
                        textColor: Kwhite,
                        height: 40,
                        width: double.infinity,
                        label: "Update",
                        fontSize: kSixteenFont,
                        fontWeight: kFW700,
                        isLoading: false,
                        onTap: () {
                          var payload = {
                            "sap_user_id": userprofilecontroller
                                .profileData["user_details"]["id"],
                            "sap_user_fname": userprofilecontroller
                                .editFirstNameController.text,
                            "sap_user_lname": userprofilecontroller
                                .editLastNameController.text,
                            "sap_user_email":
                                userprofilecontroller.editEmailController.text,
                            "sap_user_password": userprofilecontroller
                                .editPasswordController.text,
                          };
                          if (isbothpasswordscorrect == true &&
                              ispasswordcorrect == true) {
                            userprofilecontroller
                                .userEditprofilePassword(payload);
                          } else {
                            Fluttertoast.showToast(
                              msg: "Please enter Passwords correctly",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: KDarkPink_twg,
                              textColor: Kwhite,
                              fontSize: 16.0,
                            );
                          }
                        }),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    margin: EdgeInsets.only(top: 10.h),
                    borderRadius: BorderRadius.circular(8.r),
                    Color: Kform_border_twg,
                    textColor: Kwhite,
                    height: 40,
                    width: double.infinity,
                    label: "Go Back",
                    fontSize: kSixteenFont,
                    fontWeight: kFW700,
                    isLoading: false,
                    onTap: () {
                      Get.back();
                    }),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
