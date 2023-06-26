//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_final/presentation/screens/welcome_screen.dart';

// ignore: must_be_immutable
class Page5 extends StatefulWidget {
  User? user;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  Page5({Key? key, required this.auth, required this.googleSignIn, this.user})
      : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    cerrarSesion() async {
      try {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Confirmacion'),
              content: const Text(
                'Estas seguro de cerrar sesion?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    await widget.auth.signOut();
                    if (await widget.googleSignIn.isSignedIn()) {
                      await widget.googleSignIn.signOut();
                      widget.user = null;
                      setState(() {
                        widget.user = null;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Icon(Icons.settings_outlined, size: 100),
            const SizedBox(height: 30),
            const Text(
              'Ajustes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        //width: 20,
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Acerca de',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 196, 233, 226),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Contacto',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 196, 233, 226),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          cerrarSesion();
                        },
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Cerrar Sesion',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 196, 233, 226),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
