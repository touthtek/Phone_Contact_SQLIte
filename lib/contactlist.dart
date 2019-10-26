import 'package:flutter/material.dart';
import 'package:phone_contact_sqlite/addcontact.dart';
import 'package:phone_contact_sqlite/listview.dart';
import 'package:phone_contact_sqlite/model/contact.dart';
import 'package:phone_contact_sqlite/repository/database.dart';

class ContactList extends StatefulWidget{
  @override
  _ContactList createState() => _ContactList();
    

}

class _ContactList extends State<ContactList>{
 
 

@override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
         title: Text('Contact List'),
       ),
       body: ListView(
          children: <Widget>[
             new Container(height: 700.0, child: ListContactView()),
           
          ],
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){
            Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => AddContact()));
         },
         backgroundColor: Colors.orange,
          child: Icon(Icons.person_add),
       ) ,
    );
  }

}