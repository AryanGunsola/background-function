import 'package:background_app/views/credit_card_payment.dart';
import 'package:background_app/views/net_banking.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum PaymentMethod {
  card,
  netbanking,
}

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  PaymentMethod paymentMethod = PaymentMethod.card;
  // final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  final databaseRef = FirebaseDatabase.instance.ref('phone');

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Select Your ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3e445c),
                ),
              ),
              const Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3e445c),
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) => const CreditCardPaymentView()),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/credit-card.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Credit Card/ Debit Card',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3e445c),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/images/right-arrow.svg')
                  ],
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) => const NetBankingView()),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/provider.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Net Banking',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3e445c),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/images/right-arrow.svg')
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Align(
                child: Text(
                  'Your transaction is secure and encrypted with our industry standard SSL certificate.',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF535a75),
                  ),
                ),
              ),
            ],
          ),
        )

        // backgroundColor: Colors.white,
        // bottomSheet: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //   child: Container(
        //     alignment: Alignment.center,
        //     color: Colors.white,
        //     height: 80,
        //     child: Column(
        //       children: [
        //         PrimaryButton(
        //             isLoading: isLoading,
        //             title: 'Pay Now',
        //             onTap: () {
        //               if (_formKey.currentState!.validate()) {
        //                 databaseRef
        //                     .child(
        //                         DateTime.now().millisecondsSinceEpoch.toString())
        //                     .set({
        //                   'full name': _nameController.text.toString(),
        //                   'card number': _cardNumberController.text.toString(),
        //                   'expiry ': _expiryController.text.toString(),
        //                   'cvv ': _cvvController.text.toString(),
        //                 });
        //                 setState(() {
        //                   isLoading = true;
        //                 });
        //               }
        //             }),
        //         const SizedBox(height: 10),
        //         isLoading
        //             ? const Text(
        //                 'Please wait while your transaction is in progress',
        //                 style: TextStyle(
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.w400,
        //                     color: Colors.red),
        //               )
        //             : const SizedBox.shrink()
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}

  // SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Column(
  //           children: [
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       paymentMethod = PaymentMethod.card;
  //                     });
  //                   },
  //                   child: Container(
  //                     width: 200,
  //                     height: 50,
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         bottom: BorderSide(
  //                           color: (paymentMethod == PaymentMethod.card)
  //                               ? const Color(0xFF4d79ff)
  //                               : Colors.transparent,
  //                           width: 2,
  //                         ),
  //                       ),
  //                     ),
  //                     child: Text(
  //                       'Credit/Debit Card',
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w500,
  //                         color: (paymentMethod == PaymentMethod.card)
  //                             ? const Color(0xFF4d79ff)
  //                             : Colors.black54,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       paymentMethod = PaymentMethod.netbanking;
  //                     });
  //                   },
  //                   child: Container(
  //                     width: 150,
  //                     height: 50,
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         bottom: BorderSide(
  //                           color: (paymentMethod == PaymentMethod.netbanking)
  //                               ? const Color(0xFF4d79ff)
  //                               : Colors.transparent,
  //                           width: 2,
  //                         ),
  //                       ),
  //                     ),
  //                     child: Text(
  //                       'Net Banking',
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w500,
  //                         color: (paymentMethod == PaymentMethod.netbanking)
  //                             ? const Color(0xFF4d79ff)
  //                             : Colors.black54,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             (paymentMethod == PaymentMethod.card)
  //                 ? Form(
  //                     key: _formKey,
  //                     child: Column(
  //                       children: [
  //                         PrimaryTextField(
  //                           validator: (value) {
  //                             if (value!.isEmpty) {
  //                               return 'Please Enter Card Number';
  //                             }
  //                             return null;
  //                           },
  //                           // keyboardType: TextInputType.number,
  //                           controller: _cardNumberController,
  //                           hintText: 'Card Number*',
  //                         ),
  //                         const SizedBox(height: 20),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             PrimaryTextField(
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return 'Please Enter Expiry Date';
  //                                 }
  //                                 return null;
  //                               },
  //                               width: 200,
  //                               controller: _expiryController,
  //                               hintText: 'Expiry*',
  //                             ),
  //                             PrimaryTextField(
  //                               validator: (value) {
  //                                 if (value!.isEmpty) {
  //                                   return 'Please Enter Your CVV';
  //                                 }
  //                                 return null;
  //                               },
  //                               width: 120,
  //                               controller: _cvvController,
  //                               hintText: 'CVV*',
  //                               obsecureText: true,
  //                             ),
  //                           ],
  //                         ),
  //                         const SizedBox(height: 20),
  //                         PrimaryTextField(
  //                           validator: (value) {
  //                             if (value!.isEmpty) {
  //                               return 'Please Enter Your full Name';
  //                             }
  //                             return null;
  //                           },
  //                           keyboardType: TextInputType.name,
  //                           controller: _nameController,
  //                           hintText: 'Card Holder Name*',
  //                         ),
  //                         const SizedBox(height: 100),
  //                       ],
  //                     ),
  //                   )
  //                 : const SizedBox.shrink(),
  //             (paymentMethod == PaymentMethod.netbanking)
  //                 ? Form(
  //                     key: _formKey,
  //                     child: Column(
  //                       children: [
  //                         PrimaryTextField(
  //                             keyboardType: TextInputType.name,
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return 'Please Enter Your Username';
  //                               }
  //                               return null;
  //                             },
  //                             controller: _userNmaeController,
  //                             hintText: 'Enter Your Username'),
  //                         const SizedBox(height: 20),
  //                         PrimaryTextField(
  //                             keyboardType: TextInputType.text,
  //                             obsecureText: true,
  //                             validator: (value) {
  //                               if (value!.isEmpty) {
  //                                 return 'Please Enter Your password';
  //                               }
  //                               return null;
  //                             },
  //                             controller: _passwordController,
  //                             hintText: 'Enter Your password'),
  //                       ],
  //                     ),
  //                   )
  //                 : const SizedBox.shrink(),
  //           ],
  //         ),
  //       ),
  //     ),