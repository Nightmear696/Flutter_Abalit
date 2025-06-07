import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_button.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() {
    // Aquí podrías agregar la lógica para registrar al usuario
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
                "Regístrate",
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
                controller: usernameController,
              ),

              SizedBox(height: 15),

              MyTextfield(
                hintText: "Correo Electrónico",
                obscureText: false,
                icon: Icon(Icons.email),
                controller: emailController,
              ),

              SizedBox(height: 15),

              MyTextfield(
                hintText: "Contraseña",
                obscureText: true,
                icon: Icon(Icons.lock),
                controller: passwordController,
              ),

              SizedBox(height: 15),

              MyTextfield(
                hintText: "Confirmar Contraseña",
                obscureText: true,
                icon: Icon(Icons.lock),
                controller: confirmPasswordController,
              ),

              SizedBox(height: 25),

              MyButton(onTap: registerUser),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Ya tienes cuenta?"),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Inicia sesión",
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