import 'package:flutter/material.dart';

class MobileTextField extends StatelessWidget {
  final TextEditingController controller;
  const MobileTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your mobile number';
          }
          return null;
        },
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          // color: Colors.black54,
        ),
        // maxLength: 10,

        decoration: InputDecoration(
            hintText: 'Enter Your Mobile Number',
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            // fillColor: const Color(0xFFF5F5F5),
            // filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 0,
            ),
            prefixIcon: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: const Color(0xFF4d79ff).withOpacity(0.20),
                  // color: Colors.grey.withOpacity(0.30),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  '+91',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
