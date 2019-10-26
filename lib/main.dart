import 'package:flutter/material.dart';

import 'addcontact.dart';
import 'contactlist.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
       title: 'Phone Contact',
       theme: ThemeData(
         primarySwatch: Colors.orange,
       ),
      home: ContactList(),

    );
  }


}


