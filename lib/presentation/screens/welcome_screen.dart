import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:project_final/presentation/screens/sign_in_form.dart';
//import 'package:rive/rive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //User? user1;

    loginwithGoogle() async {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredentia = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      //await _firebaseAuth.signInWithCredential(credential);
      try {
        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(authCredentia);
        print(userCredential);
        return userCredential;
      } catch (e) {
        print(e);
        return null;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.asset(
                'assets/bg.json',
                //width: MediaQuery.of(context).size.width,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: const SizedBox(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Volley\nTally",
                    style: TextStyle(
                      fontSize: 70,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Una aplicacion donde organizar facilmente tus torneos, y tus partidas de Volleyball",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(height: 350),
                  FloatingActionButton.extended(
                    onPressed: () {
                      showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: 'Sign In',
                        context: context,
                        transitionBuilder:
                            (context, animation, secondaryAnimation, child) {
                          Tween<Offset> tween;
                          tween = Tween(
                            begin: const Offset(-1, 0),
                            end: Offset.zero,
                          );
                          return SlideTransition(
                            position: tween.animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            BounceInLeft(
                          duration: const Duration(milliseconds: 500),
                          child: Center(
                            child: Container(
                              height: 620,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 32,
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.94),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                  //clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Registrarse",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                        const SignInForm(),
                                        const Row(
                                          children: [
                                            Expanded(
                                              child: Divider(),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                              child: Text(
                                                "o Continuar",
                                                style: TextStyle(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Divider(),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 24,
                                          ),
                                          child: Text(
                                            "Registrandose con Apple o Google",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                CupertinoIcons.game_controller,
                                              ),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              //TODO sign in with google
                                              onPressed: () async {
                                                loginwithGoogle();
                                                // UserCredential?
                                                //     userCredentialFinal =
                                                //     await loginwithGoogle();
                                                // if (userCredentialFinal !=
                                                //     null) {
                                                //   // ignore: use_build_context_synchronously
                                                //   Navigator.pushNamed(
                                                //     context,
                                                //     "/home",
                                                //   );
                                                // }
                                              },
                                              icon: const Icon(
                                                  Icons.g_mobiledata_outlined),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.whatshot_sharp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 1,
                                        // ),
                                        Center(
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.white,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    label: const Row(
                      children: [
                        Icon(CupertinoIcons.greaterthan),
                        SizedBox(width: 10),
                        Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
