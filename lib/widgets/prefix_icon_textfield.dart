// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrefixIconTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final double? width;
  final double? height;
  final double? borderWidth;
  final bool showShadow;
  final bool showSuffixIcon;
  final String? suffixIcon;
  final bool obscureText;
  final Function? suffixOnPressed;
  final FontWeight? fontWeight;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;
  const PrefixIconTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.width,
    this.height,
    this.borderWidth,
    this.showShadow = true,
    this.showSuffixIcon = false,
    this.suffixIcon,
    this.obscureText = false,
    this.suffixOnPressed,
    this.fontWeight,
    required this.controller,
    this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      // height: height ?? 48,
      // decoration: BoxDecoration(
      // boxShadow: [
      // showShadow ? Shadows.boxShadowData() : Shadows.noBoxShadowData(),
      // ],
      // ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.number,
        validator: validator,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),

        // cursorColor: AppColors.green,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0XFFe1e3eb), width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0XFFe1e3eb), width: 1.2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0XFFe1e3eb), width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0XFFe1e3eb), width: 1.2),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              prefixIcon,
              // width: 30,
              // height: 30,
              color: const Color(0xFF5c80f8),
              fit: BoxFit.scaleDown,
            ),
          ),
          suffixIcon: showSuffixIcon
              ? InkWell(
                  onTap: () {
                    if (suffixOnPressed == null) {
                      return;
                    } else {
                      suffixOnPressed!();
                    }
                  },
                  child: SvgPicture.asset(
                    suffixIcon ?? '',
                    fit: BoxFit.scaleDown,
                  ),
                )
              : const SizedBox.shrink(),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
