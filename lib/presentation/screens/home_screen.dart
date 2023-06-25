import 'dart:developer';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:project_final/presentation/screens/pagina1.dart';
import 'package:project_final/presentation/screens/pagina2.dart';
import 'package:project_final/presentation/screens/pagina4.dart';
import 'package:project_final/presentation/screens/pagina5.dart';

//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:project_final/presentation/screens/Tournament_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    Page2(),
    //const Page3(),
    const Page4(),
    const Page5(),
  ];
  @override
  Widget build(BuildContext context) {
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
