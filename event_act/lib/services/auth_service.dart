import 'package:firebase_auth/firebase_auth.dart';
import 'package:event_act/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user? != null ? User(uid: user.uid) : null;
  }

  //sign in with email and password
}