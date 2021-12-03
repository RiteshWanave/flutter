import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String email = '', password = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                //obscureText: true,
                controller: _emailcontroller,
                /*onChanged: (value){
                  email=value;
                  print(email);
                },*/
                decoration: const InputDecoration(
                    //hintText: 'xxx yyy zzz',
                    border: OutlineInputBorder(),
                    labelText: 'email'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  fillColor: Colors.pink
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  email = _emailcontroller.text;
                  password = _passwordcontroller.text;
                  try {
                    /*var user = _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      Navigator.pushNamed(context, '/login');
                    }*/
                    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                    Navigator.pushNamed(context, '/login');
                  } catch (e) {
                    String error = e.toString();
                    print(error);
                  }

                },
                child: Text(
                  'creat account',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
