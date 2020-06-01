import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  final String imagePath;

  HeroAnimation(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 1.0,
                child: Hero(tag: "hero_$imagePath", child: Image.asset(imagePath)),
              ),
              Text(imagePath)
            ],
          ),
        ),
      ),
    );
  }
}
