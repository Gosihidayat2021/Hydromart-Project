import 'package:hydromart/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydromart/view/widget/custom_text.dart';


class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validatorFn;
  final Function(String?) onSavedFn;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    required this.title,
    required this.hintText,
    required this.validatorFn,
    required this.onSavedFn,
    this.initialValue = '',
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Container(
              width:140.h,
              decoration: BoxDecoration(
              color: const Color(0xffBCE29E),
              borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.h),
              child: CustomText(text: title,),
            ),
            labelStyle: GoogleFonts.roboto(
              backgroundColor: const Color(0xffBCE29E),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: true,
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),),
            hintStyle: TextStyle(
              color: Colors.black12,
              fontSize: 18.sp,
            ),
            suffixIcon: (title == 'Password')?Icon(Icons.lock_outlined,color: primaryColor):null
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          initialValue: initialValue,
          validator: validatorFn,
          onSaved: onSavedFn,
        ),
      ],
    );
  }
}
class CustomTextFormField2 extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validatorFn;
  final Function(String?) onSavedFn;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextFormField2({
    required this.title,
    required this.hintText,
    required this.validatorFn,
    required this.onSavedFn,
    this.initialValue = '',
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: CustomText(
          text: title,
          fontSize: 18.sp,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  const BorderSide(width: 5,color: Color(0xff7C7C7C))),
        disabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(width: 5,color: primaryColor,style: BorderStyle.solid)),
        enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  const BorderSide(width: 3,color: Color(0xff7C7C7C))),
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black12,
          fontSize: 18.sp,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        // floatingLabelStyle: const TextStyle(height: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: (title == 'Password')?Icon(Icons.lock_outlined,color: primaryColor):null
      ).copyWith(
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      validator: validatorFn,
      onSaved: onSavedFn,
    );
  }
}
