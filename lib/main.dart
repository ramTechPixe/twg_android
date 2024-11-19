import 'package:flutter/material.dart';
import 'package:twg/untils/constants.dart';
import 'package:twg/untils/export_file.dart';
import 'package:twg/untils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //////////////////////////////////////////
  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            title: "TWG",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'poppins',
              bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: Colors.transparent),
            ),
            getPages: Routes.routes,
            initialRoute:
                // kOnboarding,
                kSplash,
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!);
            });
      },
    );
    ///////////////////////////////////////////////////////
  }
}
