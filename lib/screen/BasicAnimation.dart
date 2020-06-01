import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/screen/HeroAnimation.dart';

class BasicAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _buildImage(context, "assets/chair.png"),
            _buildImage(context, "assets/ball.png"),
            _buildImage(context, "assets/telescope.png")
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imageURL) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HeroAnimation(imageURL)));
//        Navigator.push(context, PageRouteBuilder(transitionDuration: Duration(seconds: 2), pageBuilder: () => HeroAnimation(imageURL)));
      },
      child: Hero(
        tag: "hero_$imageURL",
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(75.0)),
          child: Image.asset(imageURL, width: 125, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
