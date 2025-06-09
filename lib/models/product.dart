import 'package:flutter_marti_lopez_entrga_final_abalit/config/helpers/function_of_beauty_api.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
  });

factory Product.fromDatum(Datum datum) {
  return Product(
    id: datum.id,
    name: datum.title,
    description: datum.description,
    price: datum.price,
    imagePath: datum.images.isNotEmpty
    ? datum.images[0]
    : "https://via.placeholder.com/150",
    category: nameValues.reverse[datum.category.name] ?? "",
  );
}
}