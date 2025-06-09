import 'package:http/http.dart' as http;
import 'package:flutter_marti_lopez_entrga_final_abalit/models/product.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/config/helpers/function_of_beauty_api.dart';

class Shop {
  late List<Product> productList;
  final Map<Product, int> _cart = {};

  Shop() {
    productList = [];
    fetchProducts();
  }

  Map<Product,   int> get cart => _cart;

  void addToCart(Product product, int quantity) {
    if (_cart.containsKey(product)) {
      _cart[product] = _cart[product]! + quantity;
    } else {
      _cart[product] = quantity;
    }
  }


  void deleteFromCart(Product product) {
    _cart.remove(product);
  }

  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://testback.apiabalit.com/function/function.json"),
    );

    if (response.statusCode == 200) {
      String jsonResponse = response.body;
      FunctionOfBeautyApi apiResponse = functionOfBeautyApiFromJson(
        jsonResponse,
      );
      productList = apiResponse.data
          .map((datum) => Product.fromDatum(datum))
          .toList();
    } else {
      productList = [];
    }
  }
}
