import 'package:flutter/material.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_button.dart';
import 'package:flutter_marti_lopez_entrga_final_abalit/components/my_textfield.dart';

class RecoverPage extends StatelessWidget {
  RecoverPage({super.key});

  final emailController = TextEditingController();

  void recoverPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.orange[50], 
          title: Text(
            "Correo enviado",
            style: TextStyle(
              color:
                  Colors.grey[700],
              fontFamily: "PPEiko",
              fontSize: 20,
            ),
          ),
          content: Text(
            "Te hemos enviado un enlace para recuperar tu contraseña.",
            style: TextStyle(
              color: Colors.grey[600], 
              fontFamily: "PPEiko",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Aceptar",
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[50],
        title: Text(
          "Recuperar Contraseña",
          style: TextStyle(
            color: Colors.grey[700],
            fontFamily: "PPEiko",
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "lib/images/function_app_logo.png",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 25),

              MyTextfield(
                hintText: "Correo Electrónico",
                obscureText: false,
                icon: Icon(Icons.email),
                controller: emailController,
              ),

              SizedBox(height: 300),

              MyButton(text: "Enviar", onTap: () => recoverPassword(context)),
            ],
          ),
        ),
      ),
    );
  }
}
