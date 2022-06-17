import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project5/Models/account.dart';
import 'package:project5/home_screen.dart';
import 'package:project5/signup_screen.dart';
import 'package:project5/Services/firecloud.dart';

class EditEventMVVM {

    static editEvent(String event_name, String date, String desc, Account user,) async{
      FireCloud.EditEvent(date, desc, event_name);
    }

    static deleteEvent(String event_name, Account user) async {
      FireCloud.DeleteEvent(event_name);    
    }

}