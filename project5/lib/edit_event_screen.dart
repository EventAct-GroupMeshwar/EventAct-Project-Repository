import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project5/home_screen.dart';
import 'Models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EditEvent extends StatefulWidget {
  const EditEvent({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EditEvent> createState() {
    return _EditEventState(this.event);
  }
}

class _EditEventState extends State<EditEvent> {
  final Event event;

  _EditEventState(this.event);

  


  late TextEditingController _dateController = TextEditingController(text: event.date);
  late TextEditingController _descController = TextEditingController(text: event.desc);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_return),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OrgHomeScreen()));
              }),
        ],
        title: Text('Edit Events'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(event.name, style: const TextStyle(
            color: Colors.black,
            fontSize: 44.0,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _dateController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Date of Event",
              prefixIcon: Icon(Icons.mail, color: Colors.black,),
            ),
          ),
          const SizedBox(height: 26.0,),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(
              hintText: "Description",
              prefixIcon: Icon(Icons.lock, color: Colors.black,),
            ),
          ),

          const SizedBox(height: 88.0,),
          
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                
                FirebaseFirestore.instance.collection('Events').doc(event.name).update({
                  "Date" : _dateController.text,
                  "Description": _descController.text,
                  "Name": event.name, 
                }).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OrgHomeScreen())));
                
            
                  
              },
              child: const Text("Save", style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),),
            ),
          ),


          ],
        ),
        ),
    );
  }
}