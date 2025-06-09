import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_drawer.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/product.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';

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
                Product product = products[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      product.imagePath,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported), // 🔹 Maneja errores en la carga de imágenes
                    ),
                    title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("\$${product.price.toString()}"),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()), // 🔹 Muestra un indicador de carga mientras se obtienen los productos
    );
  }
}