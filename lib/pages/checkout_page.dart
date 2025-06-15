import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';

class CheckoutPage extends StatelessWidget {
  final Shop shop;
  
  const CheckoutPage({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "lib/images/function_app_logo.png",
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}