import 'package:flutter/material.dart';

import '../../method/methods.dart';



class EquipmentEntry extends StatefulWidget {
  const EquipmentEntry({Key? key}) : super(key: key);

  @override
  State<EquipmentEntry> createState() => _EquipmentEntryState();
}

class _EquipmentEntryState extends State<EquipmentEntry> {
  bool isLoading = false;
  final TextEditingController _serno = TextEditingController();
  final TextEditingController _machine = TextEditingController();
  final TextEditingController _partno = TextEditingController();
  final TextEditingController _serialno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
      body: Center(


            child: Padding(
              padding: const EdgeInsets.fromLTRB(100.0,30.0,100.0,100.0),
              child: Column(
              children: [
                        Row(
                          children: <Widget>[

                            Text("Part Name:",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 20.0),
                            SizedBox(width: 150.0,height: 35.0,
                              child: TextField(
                                controller: _machine,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 20.0,),
                        Row(
                          children: <Widget>[
                            Text("Model #:   ",style: TextStyle(color: Colors.white),),
                            SizedBox(width: 20.0),
                            SizedBox(width: 150.0,height: 35.0,
                              child: TextField(
                                controller: _partno,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: <Widget>[
                            Text("Part #:      ",style: TextStyle(color: Colors.white),),
                            SizedBox(width: 20.0),
                            SizedBox(width: 150.0,height: 35.0,
                              child: TextField(
                                controller: _serialno,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: <Widget>[
                            Text("Serial #:   ",style: TextStyle(color: Colors.white),),
                            SizedBox(width: 20.0),
                            SizedBox(width: 150.0,height: 35.0,
                              child: TextField(
                                controller: _serno,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                SizedBox(height: 20.0,),
                        ElevatedButton(
                            child: Text("add"),
                            onPressed: (){
                              setState(() {
                                isLoading = true;
                              });
                              formUser(_machine.text,_serialno.text, _partno.text, _serno.text,);
                              isLoading = false;
                            }
                        ),
              ],
          ),
            ),
      ),
      );
  }
}



