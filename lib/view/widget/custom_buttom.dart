import 'package:hydromart/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedFn;
  const CustomButton(this.text, this.onPressedFn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 2,
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: backgroundAwal,
        alignment: Alignment.center,
      ),
    );
  }
}
class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedFn;
  const CustomButton2(this.text, this.onPressedFn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 2,
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
