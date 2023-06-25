import 'package:animate_do/animate_do.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tally extends StatefulWidget {
  String name1;
  String name2;
  Tally(this.name1, this.name2, {super.key});
  @override
  State<Tally> createState() => _TallyState();
}

class _TallyState extends State<Tally> {
  int team1 = 0;
  int team2 = 0;
  int max = 25;

  void incrementTeam1() {
    setState(() {
      if (team1 < max && team2 < max - 1) {
        team1 += 1;
        if (team1 == max) {
          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: 'Sign In',
            context: context,
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              Tween<Offset> tween;
              tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
              return SlideTransition(
                position: tween.animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
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
                              "Ganador",
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              widget.name1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Center(
                              child: Image.asset('assets/podio.gif'),
                            ),
                            FloatingActionButton.extended(
                              backgroundColor:
                                  const Color.fromARGB(255, 196, 233, 226),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              },
                              label: const Text(
                                'Volver',
                                style: TextStyle(
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
        }
      } else if (team1 < max - 1 && team2 == max - 1) {
        team1 += 1;
        if (team1 == max - 1) {
          team1 = 0;
          team2 = 0;
          max = 2;
        }
      } else {
        team1++;
      }
    });
  }

  void incrementTeam2() {
    setState(() {
      if (team2 < max && team1 < max - 1) {
        team2 += 1;
        if (team2 == max) {
          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: 'Sign In',
            context: context,
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              Tween<Offset> tween;
              tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
              return SlideTransition(
                position: tween.animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
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
                              "Ganador",
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              widget.name2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Center(
                              child: Image.asset('assets/podio.gif'),
                            ),
                            FloatingActionButton.extended(
                              backgroundColor:
                                  const Color.fromARGB(255, 196, 233, 226),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              },
                              label: const Text(
                                'Volver',
                                style: TextStyle(
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
        }
      } else if (team2 < max - 1 && team1 == max - 1) {
        team2 += 1;
        if (team2 == max - 1) {
          team1 = 0;
          team2 = 0;
          max = 2;
        }
      } else {
        team2++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String obtenerIniciales1(String nombreEquipo) {
      List<String> palabras = nombreEquipo.split(' ');
      String iniciales = '';

      for (String palabra in palabras) {
        if (palabra.isNotEmpty) {
          iniciales += palabra[0].toUpperCase();
        }
      }
      return iniciales;
    }

    return Scaffold(
      body: Stack(
        children: [
          //buttonscores
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    incrementTeam1();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 196, 233, 226),
                    child: Align(
                      alignment: Alignment.center,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              widget.name1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //backgroundColor: const Color.fromARGB(255, 196, 233, 226),
              Center(
                child: InkWell(
                  onTap: () {
                    incrementTeam2();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              widget.name2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          //SCOREBOARD
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35,
                  height: 246,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 33,
                        top: 0,
                        child: Transform(
                          //quarterTurns: 1,
                          transform: Matrix4.identity()
                            ..translate(330.0, 50.0)
                            ..rotateZ(1.57),
                          child: Container(
                            width: 246,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  team1.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    //fontStyle: FontStyle.italic,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                Text(
                                  obtenerIniciales1(widget.name1),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  obtenerIniciales1(widget.name2),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  team2.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    //fontStyle: FontStyle.italic,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(1.57),
              child: const Text(
                'VS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 60,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
