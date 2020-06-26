import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shopping_cart/screen/BasicAnimation.dart';
import 'package:shopping_cart/screen/BasicProvider.dart';
import 'package:shopping_cart/screen/FacebookLoginExample.dart';
import 'package:shopping_cart/screen/GifImage.dart';
import 'package:shopping_cart/screen/GridViewExample.dart';
import 'package:shopping_cart/screen/ShoppingCart.dart';
import 'package:shopping_cart/screen/xylophone_app.dart';
import 'package:sqflite/sqflite.dart';

import 'model/dog_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'doggie_database.db'), onCreate: (db, version) {
    return db.execute(
      "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
    );
  }, version: 1);

  Future<void> insertDog(Dog dog) async {
    final Database db = await database;
    await db.insert('dogs', dog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;
    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Widget Demos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> itemList = List<String>();

  @override
  void initState() {
    super.initState();
    itemList.add("Shopping cart");
    itemList.add("Animation");
    itemList.add("Basic Provider");
    itemList.add("GIF Images");
    itemList.add("Grid View");
    itemList.add("Facebook login");
    itemList.add("SQL Lite Demo");
    itemList.add("Xylophone App");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: _buildTile(context, itemList[index]),
          );
        },
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title) {
    return Card(
      elevation: 1.0,
      child: FlatButton(
        child: Text(title),
        onPressed: () {
          if (title == "Shopping cart") {
            navigateToShoppingCart(context, title);
          } else if (title == "Animation") {
            navigateToAnimation(context, title);
          } else if (title == "Basic Provider") {
            navigateToBasicProvider(context);
          } else if (title == "GIF Images") {
            navigateToGifImages(context);
          } else if (title == "Grid View") {
            navigateToGridView(context);
          } else if (title == "Facebook login") {
            navigateToFacebookLogin(context);
          } else if (title == "Xylophone App") {
            navigateToXylophoneApp(context);
          }
        },
      ),
    );
  }

  void navigateToXylophoneApp(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => XylophoneApp()));

  void navigateToFacebookLogin(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => FacebookLoginExample()));

  void navigateToGridView(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewExample()));

  void navigateToGifImages(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => GifImages()));

  void navigateToBasicProvider(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => BasicProvider()));

  void navigateToAnimation(BuildContext context, String title) => Navigator.push(context, MaterialPageRoute(builder: (context) => BasicAnimation()));

  void navigateToShoppingCart(BuildContext context, String title) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShoppingCart(
                title: title,
              )));
}
