import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldWithPrefixIconWidget extends StatelessWidget {
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
  const TextFieldWithPrefixIconWidget({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      // decoration: BoxDecoration(
      // boxShadow: [
      // showShadow ? Shadows.boxShadowData() : Shadows.noBoxShadowData(),
      // ],
      // ),
      child: TextField(
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
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.black,
              width: borderWidth ?? 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.black,
              width: borderWidth ?? 2,
            ),
          ),
          prefixIcon: SvgPicture.asset(
            prefixIcon,
            fit: BoxFit.scaleDown,
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
