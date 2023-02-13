import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../pages/widgets/rounded_button.dart';

class MapLongtitude extends StatefulWidget {
  @override
  _MapLongtitudeState createState() => _MapLongtitudeState();
}

class _MapLongtitudeState extends State<MapLongtitude> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        FirebaseFirestore.instance.collection("users").doc().set({

          "streetAddress": streetAddressController.text,
          "city": cityController.text,
          "state": stateController.text,
          "zip": zipController.text,
          "location": {
            "latitude": latitude,
            "longitude": longitude,
          }
        });
      });
    } catch (e) {
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Register"),
    ),
    body: Form(

        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: <Widget>[



                  TextFormField(
                    controller: streetAddressController,
                    decoration: InputDecoration(hintText: 'Street Address'),

                  ),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(hintText: 'City'),

                  ),
                  TextFormField(
                    controller: stateController,
                    decoration: InputDecoration(hintText: 'State'),

                  ),
                  TextFormField(
                    controller: zipController,
                    decoration: InputDecoration(hintText: 'Zip Code'),
                  ),
                  GestureDetector(
                    onTap: () {

                      _getCurrentLocation();

                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),


                ]
            )
        ),
      ),
    );
  }

}