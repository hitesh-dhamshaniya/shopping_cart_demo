import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xylophone app"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMusicButton(1, Colors.red),
              _buildMusicButton(2, Colors.orange),
              _buildMusicButton(3, Colors.yellow),
              _buildMusicButton(4, Colors.green),
              _buildMusicButton(5, Colors.teal),
              _buildMusicButton(6, Colors.blue),
              _buildMusicButton(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMusicButton(int no, Color color) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          AssetsAudioPlayer.newPlayer().open(Audio("assets/note$no.wav"), showNotification: true, autoStart: true);
        },
      ),
    );
  }
}
