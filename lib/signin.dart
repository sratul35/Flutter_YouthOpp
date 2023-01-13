import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  showAlert({required String text}) async{
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign In'),
          content: Text(
              '$text'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    try{
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password
                      );
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showAlert(text: 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showAlert(text: 'Wrong password provided for that user.');
                      }
                    }
         
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20, width: 15,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text("Don't have an account? Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Colors.white
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
