import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_button.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_drawer.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/checkout_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void checkout() {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CheckoutPage(shop: Shop())),
      );
    }
    final cart = context.watch<Shop>().cart;
    double totalPrice = cart.entries.fold(
      0,
      (sum, entry) => sum + (entry.key.price * entry.value),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Spacer(),
      Image.asset("lib/images/function_app_logo_cut.png", width: 75, height: 75),
      Spacer(),
    ],
  ),
  backgroundColor: Colors.orange[50],
  actions: [
    Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        backgroundImage: AssetImage("lib/images/user_avatar.png"),
        radius: 20,
      ),
    ),
  ],
),
        drawer: MyDrawer(),
        backgroundColor: Colors.orange[50],
        body: Column(
          children: [
            Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Tu carrito está vacío"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final product = cart.keys.elementAt(index);
                        final quantity = cart[product] ?? 0;

                        return ListTile(
                          leading: Image.network(product.imagePath, width: 50),
                          title: Text(product.name),
                          subtitle: Text(
                            "Precio: ${product.price}€ - Cantidad: $quantity",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (quantity > 1) {
                                    context.read<Shop>().addToCart(product, -1);
                                  } else {
                                    context.read<Shop>().deleteFromCart(
                                      product,
                                    );
                                  }
                                },
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  context.read<Shop>().addToCart(product, 1);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Divider(thickness: 1),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              color: Colors.orange[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${totalPrice.toStringAsFixed(2)}€",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Center(
                    child: MyButton(
                      onTap: () {
                        checkout();
                      },
                      text: "Checkout",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
