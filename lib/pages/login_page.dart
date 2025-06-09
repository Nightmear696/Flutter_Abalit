import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_button.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_textfield.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/home_page.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
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

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Has olvidado la contraseña?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              MyButton(onTap: () => signUserIn(context)),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("¿No tienes cuenta?"),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        // Navegación a la pantalla de registro
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
                          color: Colors.blue[900],
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
