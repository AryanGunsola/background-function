import 'package:background_app/views/home_view.dart';
import 'package:background_app/widgets/primary_button.dart';
import 'package:background_app/widgets/primary_textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final _formKey = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref('phone');
  bool? isSelected = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF4d79ff),
      //   title: const Text(
      //     'Enter Details',
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.w400,
      //     ),
      //   ),
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create Your Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3e445c),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Track your packages and much more',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'First name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        // color: Color(0xFF3e445c),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your First name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'First name',
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Last name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        // color: Color(0xFF3e445c),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Last name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'Last name',
                      controller: _companyNameController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Email ID',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        // color: Color(0xFF3e445c),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PrimaryTextField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email ID';
                        }
                        return null;
                      },
                      hintText: 'you@example.com',
                      controller: _gstNumberController,
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // PrimaryTextField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please Enter Your Email id';
                    //     }
                    //     return null;
                    //   },
                    //   keyboardType: TextInputType.emailAddress,
                    //   hintText: 'Enter Your Email id*',
                    //   controller: _emailIdController,
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // PrimaryTextField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please Enter Your Address';
                    //     }
                    //     return null;
                    //   },
                    //   keyboardType: TextInputType.text,
                    //   hintText: 'Enter Your Address*',
                    //   controller: _addressController,
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // PrimaryTextField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please Enter Your Delivery Address';
                    //     }
                    //     return null;
                    //   },
                    //   keyboardType: TextInputType.text,
                    //   hintText: 'Enter Your Delivery Address*',
                    //   controller: _deliveryController,
                    // ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 150),
                    const Text.rich(
                      TextSpan(
                        text: 'Our ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF535a75),
                        ),
                        children: [
                          TextSpan(
                            text: 'Privacy Policy ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5c80f8),
                            ),
                          ),
                          TextSpan(
                            text:
                                'outinees what personal data we collect,why we collect it, and how we use it, Our ',
                          ),
                          TextSpan(
                            text: 'Conditions of Use ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5c80f8),
                            ),
                          ),
                          TextSpan(
                            text:
                                'govern your access and use of the application ',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(-15, 0),
                          child: Checkbox(
                            activeColor: const Color(0xFF5c80f8),
                            value: isSelected,
                            onChanged: (val) {
                              isSelected = val;
                              setState(() {});
                            },
                          ),
                        ),
                        Expanded(
                          child: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: const Text(
                              'I have read and I accept the Privacy Policy and Conditions of Use ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF535a75),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: PrimaryButton(
          title: 'Create Your Profile',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              databaseRef
                  .child(DateTime.now().millisecondsSinceEpoch.toString())
                  .set({
                'full name': _nameController.text.toString(),
                'company name': _companyNameController.text.toString(),
                'gst number': _gstNumberController.text.toString(),
                'emailId ': _emailIdController.text.toString(),
                'address ': _addressController.text.toString(),
                'delivery address ': _deliveryController.text.toString(),
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const HomeView()),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
