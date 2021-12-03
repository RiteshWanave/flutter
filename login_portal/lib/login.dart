import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  late String email , password;

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
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              MaterialButton(
                onPressed: () async {
                  email = _emailcontroller.text;
                  password = _passwordcontroller.text;
                  try{
                    /*var user = _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user != null ){
                      Navigator.pushNamed(context, '/welcome');
                    }*/
                    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                    Navigator.pushNamed(context, '/welcome');
                  }
                  catch(e) {
                    String error = e.toString();
                    print(error);
                  }
                },
                child: const Text(
                  'log in',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
