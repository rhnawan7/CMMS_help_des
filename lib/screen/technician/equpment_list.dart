
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({Key? key}) : super(key: key);

  @override
  _EquipmentListState createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;

  List groupList = [];

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore
        .collection('equipment')
        .get()
        .then((value) {
      setState(() {
        groupList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
      body: isLoading
          ? Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: groupList.length,
        itemBuilder: (context, index) {
          return Column(children: [
          Table(
          children: [
            if (index == 0)
          TableRow(children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),),
                    child: Center(child: Text('Part',style: TextStyle(color: Colors.white),))),
            Container(decoration: BoxDecoration(
              border: Border.all(width: 1),),
                child: Center(child: Text('Model #',style: TextStyle(color: Colors.white),))),
            Container(decoration: BoxDecoration(
              border: Border.all(width: 1),),
                child: Center(child: Text('Serial #',style: TextStyle(color: Colors.white),))),
            Container(decoration: BoxDecoration(
              border: Border.all(width: 1),),
                child: Center(child: Text('Part #',style: TextStyle(color: Colors.white),))),
          ]),
          TableRow(children: [
          Container(decoration: BoxDecoration(
            border: Border.all(width: 1),),
              child: Center(child: Text(groupList[index]['machine'],style: TextStyle(color: Colors.white),))),
          Container(decoration: BoxDecoration(
            border: Border.all(width: 1),),
              child: Center(child: Text(groupList[index]['model'],style: TextStyle(color: Colors.white),))),
          Container(decoration: BoxDecoration(
            border: Border.all(width: 1),),
              child: Center(child: Text(groupList[index]['serialno'],style: TextStyle(color: Colors.white),))),
          Container(decoration: BoxDecoration(
            border: Border.all(width: 1),),
              child: Center(child: Text(groupList[index]['partno'],style: TextStyle(color: Colors.white),))),
          ]),
          ],
          ),
          ],
          );
        },
      ),

    );
  }
}
