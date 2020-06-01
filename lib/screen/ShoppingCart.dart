import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List numberOfItems = List<int>();

  void addItems() {
    numberOfItems.add(1);
    numberOfItems.add(2);
    numberOfItems.add(3);
    numberOfItems.add(4);
    numberOfItems.add(5);
  }

  @override
  void initState() {
    super.initState();
    addItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: numberOfItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: _shoppingItem(index),
            );
          },
        ),
      ),
    );
  }

  Widget _shoppingItem(int itemIndex) {
    return Card(
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset("assets/flutter.png", width: 100),
            _decrementButton(itemIndex),
            Text(
              '${numberOfItems[itemIndex]}',
              style: TextStyle(fontSize: 18.0),
            ),
            _incrementButton(itemIndex),
          ],
        ),
      ),
    );
  }

  Widget _incrementButton(int index) {
    return FloatingActionButton(
      heroTag: "_incrementButton$index",
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {
          numberOfItems[index]++;
        });
      },
    );
  }

  Widget _decrementButton(int index) {
    return FloatingActionButton(
        heroTag: "_decrementButton$index",
        onPressed: () {
          setState(() {
            numberOfItems[index]--;
          });
        },
        child: new Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'), color: Colors.black),
        backgroundColor: Colors.white);
  }
}
