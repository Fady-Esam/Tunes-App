import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tunes/tune_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      const Color.fromARGB(255, 16, 71, 18),
      Colors.blue,
      const Color.fromARGB(255, 215, 35, 212),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff253238),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Flutter Tune',
          style: TextStyle(
            color: Color.fromARGB(225, 255, 255, 255),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: colors
            .asMap()
            .entries
            .map(
              (e) => TuneItem(
                color: e.value,
                onTap: () async => await player.play(
                  AssetSource('note${e.key + 1}.wav'),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
