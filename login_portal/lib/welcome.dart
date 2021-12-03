import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final TextEditingController _quotecontroller = TextEditingController();
  late String quote;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedinuser;
  String displayquote = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    getQuote();
  }

  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser;
      if(user != null){
        loggedinuser = user;
        print(loggedinuser.email);
      }
    }
    catch(e){
      print(e);
    }
  }


  void getQuote() async {
    await for (var snapshot in _firestore.collection('Quotes').snapshots()){
      for (var quote in snapshot.docs){
        //print(quote.data());
        //print(quote.get('my'));
        displayquote = quote.get('my');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:
            Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your Quote',
                  ),
                  controller: _quotecontroller,
                ),
                MaterialButton(
                  onPressed: () {
                    quote = _quotecontroller.text;
                    _firestore.collection('Quotes').add({
                      'my': quote,
                    });
                    _quotecontroller.clear();
                  },
                  child: const Text('Send'),
                ),
                Text(displayquote),
              ],
            ),
        ),
      ),
    );
  }
}
