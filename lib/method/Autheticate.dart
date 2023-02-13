
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/login_client.dart';

import '../screen/client/client_home.dart';
import '../screen/login.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return ClientHome();
    } else {
      return LoginPage();
    }
  }
}
