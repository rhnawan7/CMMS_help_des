import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:maintenance/pages/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
class OrderNumberGenerator extends StatefulWidget {
  @override
  _OrderNumberGeneratorState createState() => _OrderNumberGeneratorState();
}

class _OrderNumberGeneratorState extends State<OrderNumberGenerator> {
  String _orderNumber = "";
  String _orderText = "";
  double latitude = 0.0;
  double longitude = 0.0;
  String _companyGet = '';
  dynamic _cellGet;
  var now = DateTime.now();
  var formatter = new DateFormat('yyyyMMddHHmmss');
  List<DocumentSnapshot> groupList = [];
  String uid = _auth.currentUser!.uid;
  late String _company;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _detData();
  }
  void _detData() async {
    await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: uid).get().then((value) {
      groupList = value.docs;
      setState(() {
        if (groupList != null && groupList.length > 0 && groupList[0].data() != null) {
          _companyGet = (groupList[0].data() as Map)['companyName'];
          _cellGet = (groupList[0].data() as Map)['cellNo'];
        }
      });
    });
  }
  void _generateOrderNumber() {
    setState(() {

      _orderNumber = "${_orderText}${formatter.format(now)}";
    });

    _updateOrderData();
  }

  void _updateOrderData() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;

    await FirebaseFirestore.instance.collection("orderRequest").doc().set({
      "companyName": _companyGet,
      "cellNo": _cellGet,
      "orderNo": _orderNumber,
      "orderDate": formatter.format(now),
      "orderTime": now,
      "location": {
        "latitude": latitude,
        "longitude": longitude,
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Number Generator'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              readOnly: true,
              decoration: InputDecoration(hintText: 'Company Name'),
              onChanged: (value) {
                setState(() {
                  _companyGet = value;
                });
              },
              controller: TextEditingController(text: _companyGet),
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(hintText: 'Cell No'),
              onChanged: (value) {
                setState(() {
                  _cellGet = value;
                });
              },
              controller: TextEditingController(text: _cellGet),
            ),
            SizedBox(
              height: 20.0,
            ),

            RoundButton(
              onPressed: _generateOrderNumber,
              colour: Colors.blue,
              title: 'Generate',

            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(child: Text('Request #')),
                SizedBox(width: 10.0,),
                Container(child: Text(_orderNumber)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
