//import 'dart:html';
import 'Models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project5/edit_event_screen.dart';
import 'package:project5/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrgHomeScreen extends StatefulWidget {
  const OrgHomeScreen({Key? key}) : super(key: key);

  @override
  State<OrgHomeScreen> createState() => _OrgHomeScreenState();
}

class _OrgHomeScreenState extends State<OrgHomeScreen> {
  final _auth = FirebaseAuth.instance;
  CollectionReference events = FirebaseFirestore.instance.collection('Events');

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
        title: Text('OrgCom View Events'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: events.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError){
              return Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.waiting){
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return Card( child: ListTile(
                    title: Text(data["Name"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 12.0,),
                        Text("Event Date: " + data["Date"]),
                        const SizedBox(height: 8.0,),
                        Text(data["Description"]),
                        const SizedBox(height: 12.0,),
                        RawMaterialButton(
                          fillColor: const Color(0xFF0069FE),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EditEvent(event: Event(data["Name"], data["Date"], data["Description"]))));
                          },
                          child: const Text("Edit Event Details",
                              style: TextStyle(
                              color: Colors.white,
                            )
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                      ]),
                  ));
              }).toList(),
              
            );
          } ,
        )
        
        )

    );
  }
}





class StuHomeScreen extends StatefulWidget {
  const StuHomeScreen({Key? key}) : super(key: key);

  @override
  State<StuHomeScreen> createState() => _StuHomeScreenState();
}

class _StuHomeScreenState extends State<StuHomeScreen> {
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
          "Welcome Student",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),

    );
  }
}