import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/presentation/screens/home_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Icon(Icons.email),
                ),
              ),
            ),
          ),
          const Text(
            "Contraseña",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Icon(Icons.woo_commerce_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 24,
            ),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  var userCredentialFinal;
                  var firebaseAuth;
                  var googleSignIn;
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      userCredentialFinal: userCredentialFinal,
                      auth: firebaseAuth,
                      googleSignIn: googleSignIn,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 196, 233, 226),
                  minimumSize: const Size(40, 56),
                ),
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.black,
                ),
                label: const Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
