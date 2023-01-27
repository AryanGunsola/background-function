import 'dart:async';

import 'package:background_app/views/delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _t;
  @override
  void initState() {
    super.initState();
    smsPermission();
    _t = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => const DeliveryView()),
        ),
      );
      disopeTimer();
    });
  }

  void disopeTimer() {
    _t?.cancel;
    _t = null;
  }

  void smsPermission() async {
    PermissionStatus smsStatus = await Permission.sms.request();
    if (smsStatus == PermissionStatus.granted) {}
    if (smsStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This permission is recommended'),
        ),
      );
    }
    if (smsStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          'assets/images/app-icon.png',
          width: 70,
          height: 70,
        )),
      ],
    ));
  }
}
