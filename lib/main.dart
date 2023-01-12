import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SignInScreen.dart';
import 'SignUpScreen.dart';
import 'firebase_options.dart';

void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await Firebase.initializeApp(
// // Replace with actual values
//       options: const FirebaseOptions(
//       apiKey: "AIzaSyCNz7vdO-dP0Yn5SvuLbpFsZklKsNRLdO8",
//       appId: "1:394152828240:web:9228d47373583a5debe055",
//       messagingSenderId: "394152828240",
//       projectId: "youthopp-7dd97",
//   ),
//   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),



    );
  }
}
