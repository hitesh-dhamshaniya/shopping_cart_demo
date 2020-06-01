import 'package:flutter/material.dart';
import 'package:shopping_cart/screen/BasicAnimation.dart';
import 'package:shopping_cart/screen/ShoppingCart.dart';

void main() {
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
            title: _buildTile(itemList[index]),
          );
        },
      ),
    );
  }

  Widget _buildTile(String title) {
    return Card(
      elevation: 1.0,
      child: FlatButton(
        child: Text(title),
        onPressed: () {
          if (title == "Shopping cart") {
            navigateToShoppingCart(context, title);
          } else if (title == "Animation") {
            navigateToAnimation(context, title);
          }
        },
      ),
    );
  }

  void navigateToAnimation(BuildContext context, String title) => Navigator.push(context, MaterialPageRoute(builder: (context) => BasicAnimation()));

  void navigateToShoppingCart(BuildContext context, String title) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShoppingCart(
                title: title,
              )));
}
