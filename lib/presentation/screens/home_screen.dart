import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_final/presentation/screens/pagina1.dart';
import 'package:project_final/presentation/screens/pagina2.dart';
import 'package:project_final/presentation/screens/pagina4.dart';
import 'package:project_final/presentation/screens/pagina5.dart';

//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:project_final/presentation/screens/Tournament_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  final UserCredential? userCredentialFinal;
  final FirebaseAuth auth;
  final GoogleSignIn? googleSignIn;
  const HomeScreen({
    required this.userCredentialFinal,
    super.key,
    required this.googleSignIn,
    required this.auth,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const Page1(),
      Page2(),
      Page4(user: widget.userCredentialFinal?.user),
      Page5(
          user: widget.userCredentialFinal?.user,
          auth: widget.auth,
          googleSignIn: widget.googleSignIn!),
    ];
    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            bottomBarPages.length,
            (index) => bottomBarPages[index],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: true,
                notchColor: Colors.white,
                removeMargins: false,
                bottomBarWidth: 500,
                durationInMilliSeconds: 200,
                bottomBarItems: [
                  BottomBarItem(
                    inActiveItem: Image.asset(
                      'assets/torneo.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    activeItem: Image.asset(
                      'assets/torneo.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    itemLabel: 'Torneos',
                  ),
                  BottomBarItem(
                    inActiveItem: Image.asset(
                      'assets/trueno.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    activeItem: Image.asset(
                      'assets/trueno.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    itemLabel: 'Partida',
                  ),
                  BottomBarItem(
                    inActiveItem: Image.asset(
                      'assets/perfil.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    activeItem: Image.asset(
                      'assets/perfil.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    itemLabel: 'Perfil',
                  ),
                  BottomBarItem(
                    inActiveItem: Image.asset(
                      'assets/ajustes.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.blueGrey,
                    ),
                    activeItem: Image.asset(
                      'assets/ajustes.gif',
                      width: 30,
                      height: 30,
                      //color: Colors.white,
                    ),
                    itemLabel: 'Ajustes',
                  ),
                ],
                onTap: (index) {
                  log(
                    'current selected index is $index',
                  );
                  _pageController.jumpToPage(index);
                },
              )
            : null);
  }
}
