import 'package:background_app/views/login_view.dart';
import 'package:background_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 20,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/delhivery.jpg',
            width: double.infinity,
            // height: 500,
            // fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: PrimaryButton(
              title: 'Continue',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const LoginView()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
