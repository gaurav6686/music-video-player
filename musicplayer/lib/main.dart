import 'package:flutter/material.dart';
import 'package:musicplayer/provider/song_model_provider.dart';
import 'package:provider/provider.dart';
import 'song_type.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>
      SongModelProvider(),
    child: const MusicPlayer(),
  ));
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Music Player App',
      debugShowCheckedModeBanner: false,
      home: songTypes(),
    );
  }
}
