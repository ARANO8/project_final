import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Page4 extends StatelessWidget {
  final User? user;
  const Page4({this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 233, 226),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(user?.photoURL ??
                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepng.es%2Fpng-vr8vx7%2F&psig=AOvVaw1QC7hBGiY2cp73Hl5ul31P&ust=1687838044872000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLiA-uqE4P8CFQAAAAAdAAAAABAE'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                user?.displayName ?? 'No name',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Historial de partidas',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(1.0),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Partida 1',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}
