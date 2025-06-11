import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/product.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void addToCart() {
  context.read<Shop>().addToCart(widget.product, quantity);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("${widget.product.name} añadido al carrito (x$quantity)."),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange[50]),
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            Image.network(
              widget.product.imagePath,
              height: 300,
              width: 300,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, size: 100),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontFamily: "PPEiko",
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.product.price.toString()}€",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.brown[600],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.product.description,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment:
                    Alignment.centerLeft,
                child: Text(
                  "CANTIDAD",
                  style: TextStyle(fontFamily: "Onest", color: Colors.grey[600]),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: decreaseQuantity,
                    icon: Icon(Icons.remove, size: 24, color: Colors.black),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: increaseQuantity,
                    icon: Icon(Icons.add, size: 24, color: Colors.black),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            GestureDetector(
              onTap: addToCart,
              child: Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.transparent, // 🔹 Fondo transparente
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black), // 🔹 Borde negro
                ),
                child: const Center(
                  child: Text(
                    "Añadir al carrito",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    )
    ;
  }
}
