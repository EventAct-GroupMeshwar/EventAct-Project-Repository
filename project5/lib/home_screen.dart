import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project5/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));

                //Implement logout functionality
              }),
        ],
        title: Text('Home Page'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text(
          "Welcome User",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),

    );
  }
}