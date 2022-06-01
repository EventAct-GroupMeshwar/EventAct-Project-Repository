import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project5/Models/account.dart';
import 'package:project5/home_screen.dart';
import 'package:project5/signup_screen.dart';

class FireCloud {
  static Future<String?> EditEvent(String date, String desc, String name) async {
    FirebaseFirestore.instance.collection('Events').doc(name).update({
      "Date" : date,
      "Description": desc,
      "Name": name, 
    });
    String? str = "1";
    return str;
  }
  
}