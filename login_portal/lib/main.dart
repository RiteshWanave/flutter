import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_portal/login.dart';
import 'package:login_portal/register.dart';
import 'package:login_portal/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/register' : (context) => const RegisterScreen(),
        '/welcome' : (context) => const WelcomeScreen(),
        '/login' : (context) => const LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

