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
        backgroundColor: const Color(0xFF4d79ff),
        title: const Text(
          'Enter Details',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter Your Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your full Name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'Enter Your Full Name*',
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Compnay Name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'Enter Your Compnay Name*',
                      controller: _companyNameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Company GST Number';
                        }
                        return null;
                      },
                      hintText: 'Enter Company GST Number*',
                      controller: _gstNumberController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email id';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter Your Email id*',
                      controller: _emailIdController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'Enter Your Address*',
                      controller: _addressController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Delivery Address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'Enter Your Delivery Address*',
                      controller: _deliveryController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: PrimaryButton(
          title: 'Submit',
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
