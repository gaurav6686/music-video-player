import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:musicplayer/provider/song_model_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'hindiplay.dart';
import 'englishlist.dart';
import 'hindiplay.dart';

class bolyList extends StatefulWidget {
  const bolyList({Key? key}) : super(key: key);

  @override
  State<bolyList> createState() => _bolyListState();
}

Duration _duration = Duration.zero;
Duration _position = Duration.zero;
final AudioPlayer _audioPlayer = AudioPlayer();
bool isPlaying = false;
IconData btnIcon = Icons.play_arrow;

class _bolyListState extends State<bolyList> {
  String formateTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    //  TODO: implement initState
    super.initState();

    _audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        _duration = newDuration!;
      });
    });

    _audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        _position = newPosition;
      });
    });
  }

  final OnAudioQuery _audioQuery = OnAudioQuery();

  // final _audioQuery = OnAudioQuery();

  playSong(String? uri) {
    try {
      _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      _audioPlayer.play();
    } on Exception {
      log("Error parsing song" as num);
    }
  }

  // Color bgColor = Colors.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Hindi Songs'),
        flexibleSpace: Container(
          // color: Colors.black,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black38,
            ]),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueAccent, Colors.black]),
                ),
                height: 600,
                child: Stack(
                  children: [
                    FutureBuilder<String>(
                      future: DefaultAssetBundle.of(context)
                          .loadString("AssetManifest.json"),
                      builder: (context, item) {
                        if (item.hasData) {
                          Map? jsonMap = json.decode(item.data!);
                          List? songs = jsonMap?.keys.toList();
                          return ListView.builder(
                            itemCount: songs?.length,
                            itemBuilder: (context, index) {
                              var path = songs![index].toString();
                              var title = path.split("/").last.toString();
                              title = title.replaceAll("%20", "");
                              title = title.split(".").first;

                              return Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.blueAccent, Colors.black]),
                                  border: Border.all(color: Colors.white),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black, spreadRadius: 5),
                                  ],
                                ),
                                child:ListTile(
                                title: Text(
                                  title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  path,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading: const Icon(Icons.music_note, size: 40),
                                onTap: () {
                                  _audioPlayer.setAsset(path);
                                  _audioPlayer.play();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const bolyPlay(),
                                    ),
                                  );
                                },
                                ),
                              );
                            },

                          );
                        } else {
                          return const Center(
                            child: Text("No Songs Present"),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.blue, spreadRadius: 5),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Hello EveryOne!",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (isPlaying) {
                              _audioPlayer.pause();
                            } else {
                              _audioPlayer.play();
                            }
                            isPlaying = !isPlaying;
                          });
                        },
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 40)),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 22, right: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(formateTime(_position.inSeconds)),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: _duration.inSeconds.toDouble(),
                      value: _position.inSeconds.toDouble(),
                      onChanged: (value) {
                        final _position = Duration(seconds: value.toInt());
                        _audioPlayer.seek(_position);
                        _audioPlayer.play();
                      },
                    ),
                  ),
                  Text(formateTime((_duration - _position).inSeconds)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class bolyPlay extends StatefulWidget {
  const bolyPlay({Key? key}) : super(key: key);

  @override
  State<bolyPlay> createState() => bolyPlayState();
}

class bolyPlayState extends State<bolyPlay> {
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String formateTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    //  TODO: implement initState
    super.initState();

    _audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        _duration = newDuration!;
      });
    });

    _audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        _position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70), // here the desired height
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Now Playing',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
              ),
            ),

            flexibleSpace: Container(
              // color: Colors.black,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.black38,
                ]),
              ),
            ), // ...
          )),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          // color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 100.0,
                      // backgroundImage: NetworkImage(currentCover),
                      child: Icon(
                        Icons.music_note_rounded,
                        size: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "title",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "path",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // Text("${_position.inMinutes}:${_position.inSeconds
                        //     .remainder(60)}"),
                        Text(formateTime(_position.inSeconds)),
                        Expanded(
                          child: Slider(
                            min: 0,
                            max: _duration.inSeconds.toDouble(),
                            value: _position.inSeconds.toDouble(),
                            onChanged: (value) {
                              final _position =
                                  Duration(seconds: value.toInt());
                              _audioPlayer.seek(_position);
                              _audioPlayer.play();
                            },
                          ),
                        ),
                        // Text("${_duration.inMinutes}:${_duration.inSeconds
                        //     .remainder(60)}"),
                        Text(formateTime((_duration - _position).inSeconds)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              // if(_audioPlayer.){
                              _audioPlayer.seekToPrevious();
                              // }
                            },
                            icon: const Icon(
                              Icons.skip_previous,
                              size: 40,
                            )),
                        IconButton(
                          onPressed: () {
                            if (isPlaying) {
                              _audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                                isPlaying = false;
                              });
                            } else {
                              _audioPlayer.play();
                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = true;
                              });
                            }
                          },
                          icon: Icon(
                            btnIcon,
                            size: 40,
                          ),
                          // icon: Icon(
                          //     isPlaying ? Icons.pause : Icons.play_arrow,
                          //     size: 40)
                        ),
                        IconButton(
                            onPressed: () {
                              _audioPlayer.seekToNext();
                            },
                            icon: const Icon(Icons.skip_next, size: 40)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
