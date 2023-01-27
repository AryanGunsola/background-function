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
            return 'please enter a valid 10-digit number';
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
              color: Color(0xFFa3a9c0),
            ),
            // fillColor: const Color(0xFFF5F5F5),
            // filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0XFFe1e3eb)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0XFFe1e3eb)),
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
              width: 50,
              // height: 50,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e3ec),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                border: Border.all(
                  color: const Color(0XFFe1e3eb),
                ),
              ),
              child: const Center(
                child: Text(
                  '+91',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF525b78),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
