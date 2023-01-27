import 'package:background_app/views/details_view.dart';
import 'package:background_app/widgets/mobile_textfield.dart';
import 'package:background_app/widgets/primary_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref('phone');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 2,
                    color: Color(0xFF0D253C),
                  ),
                ),
                const Text(
                  'mobile number',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D253C),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'We will send you an OTP via SMS to confirm your mobile number',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF646464),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: MobileTextField(controller: _phoneController)),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: PrimaryButton(
            title: 'Get OTP',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                databaseRef
                    .child(DateTime.now().millisecondsSinceEpoch.toString())
                    .set({'phone Number': _phoneController.text.toString()});
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((context) => const DetailsView()),
                  ),
                );
              }
            }),
      ),
    );
  }
}
