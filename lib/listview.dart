import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:phone_contact_sqlite/model/contact.dart';
import 'package:phone_contact_sqlite/repository/database.dart';

class ListContactView extends StatefulWidget{
  @override
   _ListContactView createState() => _ListContactView();
}

class _ListContactView extends State<ListContactView>{
  
  DatabaseRepo db = new DatabaseRepo();
 Future<List<Contact>> contact;
 int count = 0;

 @override
  void initState() {
    // TODO: implement initState

     contact =  db.contactList();
    contact.then((success){
      count = success.length;
      print(success.length);
    });
    print(contact.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     
    return FutureBuilder<List<Contact>>(
         future: db.contactList(),
         builder: (BuildContext context, AsyncSnapshot<List<Contact>> snaphot){
            if(snaphot.hasData)
           // return Container(child: Center(child: Text('Database is empty'),),);
            return ListView(
            children: snaphot.data
                .map((user) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                       // leading: Icon(Icons.person),
                       title: InkWell(
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(                              
                              flex: 1,
                              child: CircleAvatar(child: Icon(Icons.person),),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                          children: <Widget>[
                            Container(                              
                              child: Text(                                
                                user.name
                              ),
                            ),
                          ],
                       ),
                            )
                          ],
                       ),
                       onTap: (){},
                       ),
                       trailing: InkWell(
                         child: Icon(Icons.delete, color: Colors.red,),
                         onTap: (){},
                       )
                       
                    ),
                  )
                ))
                .toList(),
          );
         }
    );
  }


}