import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      title: Image.asset("lib/images/function_app_logo.png",width: 75, height: 75,),
      backgroundColor: Colors.orange[50],
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.orange[50],
    );
  }
}