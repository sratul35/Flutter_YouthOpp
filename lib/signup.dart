import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  showAlert({required String text}) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Up'),
          content: Text('$text'),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  controller: _nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    if (name.isEmpty || email.isEmpty || password.isEmpty) {
                      showAlert(text: 'Please fill all the fields');
                    }else{
                      try{
                        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                        if(user != null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignInScreen()));
                        }
                      }catch(e){
                        showAlert(text: e.toString());
                      }
                    }

                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text("Already have an account? Sign In",
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
