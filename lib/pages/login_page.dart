import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_button.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_textfield.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/models/shop.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/home_page.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/recover_page.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(shop: Shop())),
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "lib/images/function_app_logo.png",
                width: 200,
                height: 200,
              ),
              Text(
                "Bienvenido",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: "PPEiko",
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 25),
              MyTextfield(
                hintText: "Usuario",
                obscureText: false,
                icon: Icon(Icons.perm_identity_rounded),
              ),

              SizedBox(height: 15),
              MyTextfield(
                hintText: "Contraseña",
                obscureText: true,
                icon: Icon(Icons.lock),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Has olvidado la contraseña?",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecoverPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Recuperar",
                        style: TextStyle(
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 150),

              MyButton(text: "Inicar Sesion", onTap: () => signUserIn(context)),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿No tienes cuenta?"),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Regístrate",
                        style: TextStyle(
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
