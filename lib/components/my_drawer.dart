import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_list_tile.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/cart_page.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/home_page.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange[100],
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      "lib/images/function_app_logo.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 25),

                  MyListTile(
                    text: "Tienda",
                    icon: Icons.shopping_basket_outlined,
                    onTap: () {
                      Navigator.pop(context);

                       Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(shop: Shop())),
                      );

                    },
                  ),
                  MyListTile(
                    text: "Carrito",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                text: "Cerrar Sesión",
                icon: Icons.logout,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
