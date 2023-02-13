import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maintenance/pages/splash_screen.dart';
import 'package:maintenance/screen/technician/equipment_entry.dart';
import 'package:maintenance/screen/login.dart';

import 'method/Autheticate.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp
      (
      options: const FirebaseOptions(
        apiKey: "AIzaSyD2plRRetHR9J_uoqCzKG2sO-hySmSblDw",
        authDomain: "cmms-a5bd8.firebaseapp.com",
        projectId: "cmms-a5bd8",
        storageBucket: "cmms-a5bd8.appspot.com",
        messagingSenderId: "369257836926",
        appId: "1:99696621586:android:bb9556ed8a80ae357d80cb",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#8A02AE');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Flutter Login UI'),
    );
  }
}




