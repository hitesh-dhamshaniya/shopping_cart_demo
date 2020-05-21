import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(title: 'Shopping Cart'),
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

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: numberOfItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: _shoppingItem(index),
            );
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
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
        onPressed: () {
          setState(() {
            numberOfItems[index]--;
          });
        },
        child: new Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'), color: Colors.black),
        backgroundColor: Colors.white);
  }
}
