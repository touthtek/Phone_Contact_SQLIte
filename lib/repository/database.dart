import 'package:path/path.dart';
import 'package:phone_contact_sqlite/model/contact.dart';
import 'package:phone_contact_sqlite/model/contact.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo{

     var database; 

     Future<void>  OpenDatabase() async{

         database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'phone_contact.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, facebook TEXT, twitter TEXT, linkedin TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

     }

      
      Future<void> insertContact(Contact contact) async {
        print(contact.name);

    // Get a reference to the database.
     await OpenDatabase();
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> contactList() async {
    // Get a reference to the database.
    await OpenDatabase();
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        name: maps[i]['name'],
        facebook: maps[i]['facebook'],
        twitter: maps[i]['twitter'],
        linkedin: maps[i]['linkedin']
      );
    });
  }

  Future<void> updateContact(Contact contact) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'contacts',
      contact.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'contacts',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }





}