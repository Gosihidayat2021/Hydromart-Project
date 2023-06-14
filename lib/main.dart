import 'package:hydromart/bindings/binding.dart';
import 'package:hydromart/view/themes/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(360, 690)
            : const Size(690, 360),
        builder: (BuildContext, child) => GetMaterialApp(
          initialBinding: Binding(),
          home: ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'HydroMart', 
          theme: ThemeData.light().copyWith(
          primaryColor: primaryColor, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor,primary: primaryColor)
          ),
        ),
      ),
    );
  }
}
