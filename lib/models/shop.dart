import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_marti_lopez_entrga_final_abalit/models/product.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/config/helpers/function_of_beauty_api.dart';

class Shop {
  late List<Product> productList;

  Shop() {
    productList = []; // 🔹 Inicializa la lista vacía para evitar errores
    fetchProducts(); // 🔹 Llama al método para obtener los productos
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse("https://testback.apiabalit.com/function/function.json"));

      if (response.statusCode == 200) {
        String jsonResponse = response.body;
        print("JSON recibido de la API:");
        print(jsonResponse);

        FunctionOfBeautyApi apiResponse = functionOfBeautyApiFromJson(jsonResponse);
        productList = apiResponse.data.map((datum) => Product.fromDatum(datum)).toList();
      } else {
        print("Error al obtener los datos: ${response.statusCode}");
        productList = []; // 🔹 Previene el error si la API falla
      }
    } catch (e) {
      print("Error en la solicitud HTTP: $e");
      productList = [];
    }
  }
}
