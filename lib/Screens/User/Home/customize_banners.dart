import 'package:twg/untils/export_file.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img_lib;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stack_art_board/stack_art_board.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:twg/untils/export_file.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img_lib;
import 'package:onscreen_keyboard/onscreen_keyboard.dart';

class CustomizeBanners extends StatefulWidget {
  const CustomizeBanners({super.key});

  @override
  State<CustomizeBanners> createState() => _CustomizeBannersState();
}

class _CustomizeBannersState extends State<CustomizeBanners> {
  final StackArtBoardController controller = StackArtBoardController();
  DashboardController dashboardcontroller = Get.put(DashboardController());
  final List<String> stickerList = <String>[];
  final CropController cropController = CropController();
  final GlobalKey _repaintBoundaryKey = GlobalKey();
  Uint8List _imageData = Uint8List(0);
  double _fontSize = 20;
  Color _textColor = Colors.black;
  String _fontFamily = 'Roboto';
  var selectedData = Get.arguments[0];

  final TextEditingController _textController = TextEditingController();

  Color _containerColor = Colors.white;
  //emoji
  final List<String> emojis = [
    '😀',
    '😃',
    '😄',
    '😁',
    '😆',
    '😅',
    '😂',
    '🤣',
    '😊',
    '😇',
    '🙂',
    '🙃',
    '😉',
    '😌',
    '😍',
    '🥰',
    '😘',
    '😗',
    '😙',
    '😚',
    '😋',
    '😜',
    '😝',
    '😛',
    '🤑',
    '🤗',
    '🤩',
    '🤔',
    '🤨',
    '😐',
    '😑',
    '😶',
    '🙄',
    '😏',
    '😣',
    '😥',
    '😮',
    '😯',
    '😲',
    '😳',
    '🥺',
    '😦',
    '😧',
    '😨',
    '😩',
    '😬',
    '😭',
    '😰',
    '😱',
    '😳',
    '😵',
    '😶‍🌫️',
    '😧',
    '😦',
    '😮',
    '🥱',
    '😴',
    '😌',
    '🤤',
    '🤧',
    '🥴',
    '😵‍💫',
    '😻',
    '💀',
    '👻',
    '🤖',
    '👽',
    '💩',
    '🦸‍♂️',
    '🦸‍♀️',
    '🦹‍♂️',
    '🦹‍♀️',
    '🦸‍♂️',
    '🦸‍♀️',
    '🦸‍♂️',
    '🦸‍♀️',
    '🦹‍♂️',
    '🦹‍♀️',
    '🌱',
    '🌿',
    '🍀',
    '🌾',
    '🌷',
    '🌹',
    '🥀',
    '🌺',
    '🌸',
    '💐',
    '🌼',
    '🌻',
    '💮',
    '🍂',
    '🍁',
    '🍃',
    '🍄',
    '🌰',
    '🌍',
    '🌎',
    '🌏',
    '🌍',
    '🌎',
    '🌏',
    '🌏',
    '🌍',
    '🌎',
    '🌏',
    '🌍',
    '🌎',
    '🍀',
    '🌴',
    '🌵',
    '🌾',
    '🌱',
    '🌸',
    '🌷',
    '🌺',
    '🍂',
    '🍁',
  ];

  String selectedEmojis = '';

  void _openEmojiDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          contentPadding: EdgeInsets.zero,
          title: const Text(
            "Select an Emoji",
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: List.generate(
                emojis.length,
                (index) {
                  final emoji = emojis[index];
                  return GestureDetector(
                    onTap: () {
                      controller.add(
                        CustomCanvasItem(
                          child: Text(
                            emoji,
                            style: TextStyle(fontSize: 30, color: Kwhite),
                          ),
                          canvasConfig: CanvasConfig(
                            size: const Size(600, 600),
                            transform: Matrix4.identity(),
                            allowUserInteraction: true,
                          ),
                        ),
                      );

                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  ///

  void _openStickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Select a Sticker",
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: stickerList
                  .map((sticker) => GestureDetector(
                        onTap: () {
                          // print('Selected: $sticker');
                          controller.add(
                            CustomCanvasItem(
                              child: Image.asset(
                                sticker,
                              ),
                              canvasConfig: CanvasConfig(
                                size: const Size(600, 600),
                                transform: Matrix4.identity(),
                                allowUserInteraction: true,
                              ),
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            sticker,
                            width: 70, // Fixed width for each image
                            height: 70, // Fixed height for each image
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey,
                                width: 70,
                                height: 70,
                                child: const Icon(Icons.broken_image),
                              );
                            },
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  // original
  // void _openStickerDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         insetPadding: EdgeInsets.all(10),
  //         contentPadding: EdgeInsets.zero,
  //         title: const Text(
  //           "Select a Sticker",
  //           textAlign: TextAlign.center,
  //         ),
  //         content: SingleChildScrollView(
  //           child: Wrap(
  //             spacing: 8.0, // Horizontal spacing between images
  //             runSpacing: 8.0, // Vertical spacing between images
  //             alignment: WrapAlignment.center,
  //             children: stickerList
  //                 .map((sticker) => GestureDetector(
  //                       onTap: () {
  //                         // print('Selected: $sticker');
  //                         controller.add(
  //                           CustomCanvasItem(
  //                             child: Image.asset(
  //                               sticker,
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
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(8),
  //                         child: Image.asset(
  //                           sticker,
  //                           width: 70, // Fixed width for each image
  //                           height: 70, // Fixed height for each image
  //                           fit: BoxFit.cover,
  //                           errorBuilder: (context, error, stackTrace) {
  //                             return Container(
  //                               color: Colors.grey,
  //                               width: 70,
  //                               height: 70,
  //                               child: const Icon(Icons.broken_image),
  //                             );
  //                           },
  //                         ),
  //                       ),
  //                     ))
  //                 .toList(),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void _openContainerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Select Container Color',
            style: GoogleFonts.poppins(
                color: Kform_border_twg,
                fontSize: kTwentyFont,
                fontWeight: kFW500),
          ),
          content: SizedBox(
            height: double.infinity,
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      margin: EdgeInsets.only(top: 36.h),
                      borderRadius: BorderRadius.circular(8.r),
                      Color: Kform_border_twg,
                      textColor: Kwhite,
                      height: 40,
                      width: 200.w,
                      label: "Select Colour",
                      fontSize: kSixteenFont,
                      fontWeight: kFW700,
                      isLoading: false,
                      onTap: () async {
                        Color? color = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Pick Container Color'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: _containerColor,
                                  onColorChanged: (color) => setState(() {
                                    _containerColor = color;
                                  }),
                                  showLabel: false,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    Navigator.of(context).pop(_containerColor);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        if (color != null) {
                          setState(() {
                            _containerColor = color;
                          });
                        }
                      },
                    ),
                    CustomButton(
                      margin: EdgeInsets.only(top: 36.h),
                      borderRadius: BorderRadius.circular(8.r),
                      Color: Kform_border_twg,
                      textColor: Kwhite,
                      height: 40,
                      width: 200.w,
                      label: "Set White Colour",
                      fontSize: kSixteenFont,
                      fontWeight: kFW700,
                      isLoading: false,
                      onTap: () async {
                        controller.add(
                          CustomCanvasItem(
                            child: Container(
                              color: Kwhite,
                            ),
                            canvasConfig: CanvasConfig(
                              size: const Size(600, 600),
                              transform: Matrix4.identity(),
                              allowUserInteraction: true,
                            ),
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                    CustomButtonGradientOutlined(
                      margin: EdgeInsets.only(top: 20.h),
                      label: "Add +",
                      isLoading: false,
                      height: 40,
                      width: 200.w,
                      fontSize: kSixteenFont,
                      textColor: KBlack_twg,
                      fontWeight: kFW500,
                      Padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      onTap: () {
                        controller.add(
                          CustomCanvasItem(
                            child: Container(
                              color: _containerColor,
                            ),
                            canvasConfig: CanvasConfig(
                              size: const Size(600, 600),
                              transform: Matrix4.identity(),
                              allowUserInteraction: true,
                            ),
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Custom text',
            style: GoogleFonts.poppins(
                color: Kform_border_twg,
                fontSize: kTwentyFont,
                fontWeight: kFW500),
          ),
          content: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 3.w, right: 3.w),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomFormFields(
                          readOnly: true,
                          ontap: () {
                            _focusNode.unfocus();
                          },
                          focusNode: _focusNode,
                          controller: _textController,
                          enabled: true,
                          labelColor: KText,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "Enter Text in keyboard",
                          maxLines: 1,
                          label: "",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Slider(
                          label: 'Font Size',
                          value: _fontSize,
                          min: 16,
                          max: 50,
                          onChanged: (value) {
                            setState(() {
                              _fontSize = value;
                            });
                          },
                        ),
                        CustomButton(
                          margin: EdgeInsets.only(top: 20.h),
                          borderRadius: BorderRadius.circular(8.r),
                          Color: Kform_border_twg,
                          textColor: Kwhite,
                          height: 40,
                          width: 200.w,
                          label: "Select Colour",
                          fontSize: kSixteenFont,
                          fontWeight: kFW700,
                          isLoading: false,
                          onTap: () async {
                            Color? color = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pick Text Color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: _textColor,
                                      onColorChanged: (color) =>
                                          _textColor = color,
                                      showLabel: false,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Got it'),
                                      onPressed: () {
                                        Navigator.of(context).pop(_textColor);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            if (color != null) {
                              setState(() {
                                _textColor = color;
                              });
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          width: 200,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: _fontFamily,
                            isExpanded: true,
                            underline: SizedBox(),
                            items: <String>[
                              'Roboto',
                              'Lobster',
                              'Pacifico',
                              'Poppins'
                            ]
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _fontFamily = value!;
                              });
                            },
                          ),
                        ),
                        CustomButtonGradientOutlined(
                          margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                          label: "Add +",
                          isLoading: false,
                          height: 40,
                          width: 200.w,
                          fontSize: kSixteenFont,
                          textColor: KBlack_twg,
                          onTap: _addTextOverlay,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: OnscreenKeyboard(
                        value: '',
                        backgroundColor: Kwhite,
                        buttonColor: Colors.amber,
                        focusColor: Colors.red,
                        onChanged: (txt) {
                          setState(() {
                            _textController.text = txt!;
                          });
                        },
                        initialCase: InitialCase.LOWER_CASE,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    initialiseStickerList();
    setState(() {
      dashboardcontroller.isFormselected.value = false;
    });
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _addTextOverlay() {
    String text = _textController.text;
    if (text.isNotEmpty) {
      CustomCanvasItem textOverlay = CustomCanvasItem(
        child: Container(
          child: Text(
            text,
            style: TextStyle(
              color: _textColor,
              fontSize: _fontSize,
              fontFamily: _fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        canvasConfig: CanvasConfig(
          size: Size(text.length * _fontSize, _fontSize * 2),
          transform: Matrix4.identity(),
          allowUserInteraction: true,
        ),
      );

      controller.add(textOverlay);
      Navigator.of(context).pop();
      _textController.clear();
    }
  }

  Future<void> _downloadImage() async {
    try {
      RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Get the directory to save the file
      final directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/capturedFile.png';
      final File file = File(filePath);

      // Save the image as a file
      await file.writeAsBytes(pngBytes);

      // Show dialog with captured image and file details
      showDialog<void>(
        context: context,
        builder: (_) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Captured Image',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Image.memory(pngBytes),
            ],
          ),
        ),
      );
    } catch (e) {
      _showAlertDialog(
        title: 'Error',
        content: 'Failed to capture and save image: ${e.toString()}',
      );
    }
  }

  void _showAlertDialog({required String title, required String content}) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _addImageOverlay() async {
    final imagePick = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (imagePick == null) return;

    final imageBytes = await imagePick.readAsBytes();
    _imageData = Uint8List.fromList(imageBytes);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.zero,
          title: const Text('Crop Image'),
          content: SizedBox(
            width: double.maxFinite,
            child: Crop(
              image: _imageData,
              controller: cropController,
              aspectRatio: 4 / 3,
              baseColor: Colors.blue.shade900,
              maskColor: Colors.white.withAlpha(100),
              radius: 20,
              onCropped: (croppedData) async {
                Navigator.of(context).pop();
                final img_lib.Image? croppedImage =
                    img_lib.decodeImage(croppedData);
                if (croppedImage != null) {
                  final imageBytes = img_lib.encodePng(croppedImage);

                  controller.add(
                    TransparentBgImageCanvasItem(
                      image: croppedImage,
                      imageBytes: imageBytes,
                      canvasConfig: CanvasConfig(
                        size: Size(croppedImage.width.toDouble(),
                            croppedImage.height.toDouble()),
                        transform: Matrix4.identity(),
                        allowUserInteraction: true,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                cropController.crop();
              },
              child: const Text('Done'),
            ),
            TextButton(
              onPressed: () async {
                final img_lib.Image? originalImage =
                    img_lib.decodeImage(_imageData);
                if (originalImage != null) {
                  final originalImageBytes = img_lib.encodePng(originalImage);

                  controller.add(
                    TransparentBgImageCanvasItem(
                      image: originalImage,
                      imageBytes: originalImageBytes,
                      canvasConfig: CanvasConfig(
                        size: Size(originalImage.width.toDouble(),
                            originalImage.height.toDouble()),
                        transform: Matrix4.identity(),
                        allowUserInteraction: true,
                      ),
                    ),
                  );
                }

                Navigator.of(context).pop();
              },
              child: const Text('Skip'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 3,
          shadowColor: kblack,
          backgroundColor: Kblue_twg,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Kwhite,
              size: 23.sp,
            ),
          ),
          title: Text(
            "Create Banners",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body:
          // selectedData
          selectedData == "landscape"
              ? Center(
                  child: RepaintBoundary(
                    key: _repaintBoundaryKey,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
                      height: screenSize.height,
                      width: screenSize.width,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double artBoardWidth = constraints.maxWidth;
                          double artBoardHeight = artBoardWidth / 1.91;

                          return StackArtBoard(
                            stackArtBoardKey: UniqueKey(),
                            controller: controller,
                            artBoardConfig: ArtBoardConfig(
                              containerSize: Size(
                                  constraints.maxWidth, constraints.maxHeight),
                              artBoardSize: Size(artBoardWidth, artBoardHeight),
                              toolIconWidth: 20,
                              borderWidth: 5,
                              borderColor: Colors.black,
                              rotateWidget: Container(
                                color: Colors.orange,
                                child: Icon(
                                  Icons.rotate_left,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              deleteWidget: Container(
                                color: Colors.pink,
                                child: Icon(
                                  Icons.clear,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            background:
                                Container(color: kblack.withOpacity(0.7)),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : selectedData == "square"
                  ? Center(
                      child: RepaintBoundary(
                        key: _repaintBoundaryKey,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double artBoardWidth = constraints.maxWidth;
                              double artBoardHeight = constraints.maxWidth;

                              return StackArtBoard(
                                stackArtBoardKey: UniqueKey(),
                                controller: controller,
                                artBoardConfig: ArtBoardConfig(
                                  containerSize: Size(constraints.maxWidth,
                                      constraints.maxHeight),
                                  artBoardSize:
                                      Size(artBoardWidth, artBoardHeight),
                                  toolIconWidth: 20,
                                  borderWidth: 5,
                                  borderColor: Colors.black,
                                  rotateWidget: Container(
                                    color: Colors.orange,
                                    child: Icon(
                                      Icons.rotate_left,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  deleteWidget: Container(
                                    color: Colors.pink,
                                    child: Icon(
                                      Icons.clear,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                background:
                                    Container(color: kblack.withOpacity(0.7)),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: RepaintBoundary(
                      key: _repaintBoundaryKey,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 16.w, right: 16.w, bottom: 16.h, top: 50.h),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return StackArtBoard(
                              stackArtBoardKey: UniqueKey(),
                              controller: controller,
                              artBoardConfig: ArtBoardConfig(
                                containerSize: Size(constraints.maxWidth,
                                    constraints.maxHeight),
                                artBoardSize: Size(constraints.maxWidth * 1.5,
                                    constraints.maxHeight * 1.5),
                                toolIconWidth: 20,
                                borderWidth: 5,
                                borderColor: Colors.black,
                                rotateWidget: Container(
                                  color: Colors.orange,
                                  child: Icon(
                                    Icons.rotate_left,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                deleteWidget: Container(
                                  color: Colors.pink,
                                  child: Icon(
                                    Icons.clear,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              background:
                                  Container(color: kblack.withOpacity(0.7)),
                            );
                          },
                        ),
                      ),
                    )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _openContainerDialog();
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.filter_frames,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: _openDialog,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.abc,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: _addImageOverlay,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.image,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: _openStickerDialog,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.celebration_outlined,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: _openEmojiDialog,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.emoji_emotions,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.moveToTop();
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.moveToBottom();
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 24,
                color: Kwhite,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _downloadImage();
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kblack,
              ),
              child: Icon(
                Icons.file_download,
                size: 24,
                color: Kwhite,
              ),
            ),
          )
        ],
      ),
    );
  }

  void initialiseStickerList() {
    for (var i = 0; i < 27; i++) {
      stickerList.add('assets/Stickers/$i.png');
    }
  }
}
