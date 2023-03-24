import 'dart:math';
import 'package:flutter/material.dart';
import 'package:musicplayer/provider/song_model_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'hindiplay.dart';

class hindisongs extends StatefulWidget {
  const  hindisongs({super.key});

  @override
  State<hindisongs> createState() => _hindisongsState();
}

class _hindisongsState extends State<hindisongs> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  // final _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();
  playSong(String? uri) {
    try {
      _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      _audioPlayer.play();
    } on Exception {
      log("Error parsing song" as num);
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(218, 22, 21, 21),
      appBar: AppBar(
        title: const Text('Play Hindi Songs'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 67, 162, 240),
              Color.fromARGB(255, 42, 56, 139),
            ]),
          ),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
          future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true,
          ),
          builder: (context, item) {
            if (item.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (item.data!.isEmpty) {
              return const Center(
                child: Text("No Songs Found"),
              );
            }
            return ListView.builder(
              // itemCount: item.data!.length,
              itemBuilder: (context, index) => ListTile(
                trailing: const Icon(Icons.music_note),
                title: Text(item.data![index].displayNameWOExt),
                subtitle: Text("${item.data![index].artist}"),
                leading: QueryArtworkWidget(
                  // child: Icon(Icons.music_note),
                  id: item.data![index].id,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const Icon(Icons.music_note)
                  ,
                ),
                onTap: () {
                  context.read<SongModelProvider>().setId(item.data![index].id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => hindiplay(songModel:item.data![index],audioPlayer: _audioPlayer),),);
                  // playSong(item.data![index].uri);
                },
              ),
              itemCount: item.data!.length,
            );
          }),
    );
  }
}

