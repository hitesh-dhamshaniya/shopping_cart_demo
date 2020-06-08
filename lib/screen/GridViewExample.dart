import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGridView(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        100,
        (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        },
      ),
    );
  }
}
