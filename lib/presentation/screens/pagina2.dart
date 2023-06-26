import 'package:flutter/material.dart';
import 'package:project_final/presentation/screens/tally.dart';

// ignore: must_be_immutable
class Page2 extends StatelessWidget {
  final team1controller = TextEditingController();
  final team2controller = TextEditingController();

  String team1name = '';
  String team2name = '';

  Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                'Iniciar partida rapida',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Primer equipo:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 16,
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 84,
                      child: _primerEquipo(team1controller),
                    ),
                  ),
                  const SizedBox(
                    // width: 58,
                    height: 80,
                    child: Text(
                      'VS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const Text(
                    'Segundo equipo:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 16,
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 84,
                      child: _segundoEquipo(team2controller),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: FloatingActionButton.extended(
                onPressed: () {
                  team1name = team1controller.text;
                  team2name = team2controller.text;
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Tally(team1name, team2name);
                        },
                      ),
                      (route) => false,
                    );
                  }
                },
                backgroundColor: const Color.fromARGB(255, 196, 233, 226),
                label: const Text(
                  'Comenzar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _segundoEquipo(TextEditingController team2controller) {
    return TextFormField(
      controller: team2controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Este campo es obligatorio';
        }
      },
      decoration: const InputDecoration(
        //labelText: 'first team',
        border: OutlineInputBorder(),
        hintText: 'Ingrese el nombre del segundo equipo',
        hintStyle: TextStyle(
          color: Color(0xFFD2D2D2),
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.looks_two_outlined),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }

  TextFormField _primerEquipo(TextEditingController team1controller) {
    return TextFormField(
      controller: team1controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Este campo es obligatorio';
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Ingrese el nombre del primer equipo',
        hintStyle: TextStyle(
          color: Color(0xFFD2D2D2),
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.looks_one_outlined),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
