import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange[100],
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("lib/images/function_app_logo.png",width: 200, height: 200,),
            ),

        ],
      ),
    );
  }
}