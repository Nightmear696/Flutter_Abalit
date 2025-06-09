import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shop shop = Shop();
  await shop.fetchProducts();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        
      ),
    );
  }

}
