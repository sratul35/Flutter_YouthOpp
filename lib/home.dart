import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youth/signin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You are logged in'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignInScreen()));
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
