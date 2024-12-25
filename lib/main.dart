import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bank/screens/home_page';
// ignore: unused_import
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAId3yEKI8ZFug--BPjOi8lr1g4oMozssc",
      authDomain: "bank-3deaa.firebaseapp.com",
      projectId: "bank-3deaa",
      storageBucket: "bank-3deaa.firebasestorage.app",
      messagingSenderId: "635564986945",
      appId: "1:635564986945:web:d3a2264b2f44a1cc49acc0"
    ),
  );
    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nano Mobile',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




