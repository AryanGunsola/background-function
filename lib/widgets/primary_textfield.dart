import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final double? width;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obsecureText;
  // final Int? maxLength;
  const PrimaryTextField({
    Key? key,
    required this.validator,
    required this.controller,
    this.width,
    required this.hintText,
    this.keyboardType,
    this.obsecureText = false,
    // this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      // height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.number,
        validator: validator,
        obscureText: obsecureText,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          // color: Colors.black54,
        ),
        // maxLength: maxLength! ?? 50,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          fillColor: const Color(0xFFF5F5F5),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 0,
          ),
        ),
      ),
    );
  }
}
