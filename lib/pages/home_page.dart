import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      title: Text("Shop Page"),
      backgroundColor: Colors.orange[50],
      ),
      drawer: MyDrawer(),
    );
  }
}