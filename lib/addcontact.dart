import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:phone_contact_sqlite/contactlist.dart';
import 'package:phone_contact_sqlite/model/contact.dart';
import 'package:phone_contact_sqlite/repository/database.dart';
import 'package:sqflite/sqflite.dart';

class AddContact extends StatefulWidget{
  @override  
     _AddContact createState() => _AddContact();
 
}

class _AddContact extends State<AddContact>{
  final _padding = 10.0;
  var _formkey = GlobalKey<FormState>();
  TextEditingController _contactNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _facebookController = TextEditingController();
  TextEditingController _twitterController = TextEditingController();
  TextEditingController _linkedinController = TextEditingController();
  DatabaseRepo db = new DatabaseRepo();
   @override
  void initState() {
    // TODO: implement initState
   /// db.OpenDatabase();
    super.initState();
  }



  
      

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(title: Text('Add Contact'),),
       body: ListView(
         children: <Widget>[
           Center(         
              child : Container(
                padding: EdgeInsets.only(left:_padding, right: _padding, bottom: _padding, top: _padding * 2),
                child: Column(
                
         children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.supervised_user_circle,
                 size: 120,
                ),
              radius: 80,
            ),
             SizedBox( height: 20,),
            TextFormField(
                 controller: _contactNameController,
                 decoration: InputDecoration(
                   labelText: 'Name',
                   hintText: 'Enter name',
                   errorStyle: TextStyle(color: Colors.red),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0)
                   )
                 ),
                
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                 hintText: 'Enter phone number',
                 errorStyle: TextStyle(color: Colors.red),
                 labelText: 'Phone Number',
                 
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _facebookController,
              decoration: InputDecoration(
                 hintText: 'Enter facebook link',
                 labelText: 'Facebook',
                 errorStyle: TextStyle(color: Colors.red),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 )
              ),
            ),
           SizedBox(height: 20,),
           TextFormField(
             controller: _twitterController,
             decoration: InputDecoration(
               hintText: 'Enter Twitter Link',
               labelText: 'Twitter',
               errorStyle: TextStyle(color: Colors.red),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5.0)
               )
             ),
           ),
           SizedBox(height: 20,),
           TextFormField(
             controller: _linkedinController,
             decoration: InputDecoration(
               hintText: 'Enter LinkedIn',
               labelText: 'LinkedIn',
               border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
               ),
             ),
           ),
           SizedBox(height: 20,),
           Row(
             children: <Widget>[
               Expanded(
                 child: RaisedButton(
                    child: Text('Reset'),
                    onPressed: (){
                      _reset();
                    },
                    color: Colors.redAccent,
                    textColor: Colors.white,
                 ),
               ),
               SizedBox(width: 10,),
               Expanded(
                 child: RaisedButton(
                    child: Text('Submit'),
                    onPressed: ()async {
                        _Submit(context);
                    } ,
                    color: Colors.orange,
                    textColor: Colors.white,
                 ),
               )
             ],
           )
         ],
       ),
              ),
        )
         ],
       )
       
    );

  }


void _Submit(context) async
  {
    try{
      print('submit contact');
    Contact contact = new Contact(
        facebook: _facebookController.text,
        linkedin: _linkedinController.text,
        twitter: _twitterController.text,
        name: _contactNameController.text

    );
    
    print(contact);
     await db.insertContact(contact);
     print('Contact Added');
     _showDialog(context);
    }
    catch(e)
    {
      print(e);
    }
  }

  void _reset()
  {
    _facebookController.text = '';
    _linkedinController.text ='';
    _twitterController.text = '';
    _contactNameController.text = '';
    _phoneController.text = '';
  }


 _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
       barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Contact has been added Successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                _reset();
                 Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => ContactList()));
                
              },
            ),
          ],
        );
      },
       
    );

  }





}

