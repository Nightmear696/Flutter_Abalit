import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/product.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/product_detail_page.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatefulWidget {
  final Product product;
  final Shop shop;

  const MyProductTile({super.key, required this.product, required this.shop});

  @override
  MyProductTileState createState() => MyProductTileState();
}

class MyProductTileState extends State<MyProductTile> {
  void addToCart() {
  context.read<Shop>().addToCart(widget.product, 1);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("${widget.product.name} agregado al carrito.")),
  );
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: widget.product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orange[50], 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PPEiko",
                  ),
                ),
                Text(
                  "${widget.product.price.toString()}€",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[600],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.product.imagePath,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 80),
                ),
              ),
            ),

            SizedBox(height: 10),

            Center(
              child: GestureDetector(
                onTap: addToCart,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                    color: Colors.transparent,
                  ),
                  child: const Center(
                    child: Text(
                      "Añadir al carrito",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:10,),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}