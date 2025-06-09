import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_drawer.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/product.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_product_tile.dart'; // 🔹 Importa el nuevo widget

class HomePage extends StatefulWidget {
  final Shop shop;

  const HomePage({super.key, required this.shop});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    await widget.shop.fetchProducts(); // 🔹 Espera a que los productos se carguen desde la API
    setState(() {
      products = widget.shop.productList; // 🔹 Actualiza la UI con los productos obtenidos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset("lib/images/function_app_logo.png", width: 75, height: 75),
        backgroundColor: Colors.orange[50],
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.orange[50],
      body: products.isNotEmpty
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return MyProductTile(product: products[index], shop: Shop(),); 
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}