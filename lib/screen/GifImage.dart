import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GifImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GIF Image Demo")),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Image.network(
                  'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
                ),
                Stack(
                  children: <Widget>[
                    Center(child: CircularProgressIndicator()),
                    Center(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                    ),
                  ],
                ),
                FadeInImage.assetNetwork(
                  placeholder: "assets/ball.png",
                  image: 'https://picsum.photos/250?image=10',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
