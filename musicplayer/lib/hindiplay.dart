import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayer/provider/song_model_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class hindiplay extends StatefulWidget {
  const hindiplay({Key? key,required this.songModel, required this.audioPlayer}) : super(key: key);
  final SongModel songModel;
  final AudioPlayer audioPlayer;

  @override
  _hindiplayState createState() => _hindiplayState();
}

class _hindiplayState extends State<hindiplay> {

   Duration _duration = const Duration();
   Duration _position =  const Duration();
  // final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playSong();
  }

  void playSong() {
    try {
      widget.audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse(widget.songModel.uri!)));
      widget.audioPlayer.play();
      _isPlaying = true;
    } on Exception {
      log("Error parsing song" as num);
    }

    widget.audioPlayer.durationStream.listen((d) {
      setState(() {
        _duration = d!;
      });
    });

    widget.audioPlayer.positionStream.listen((p) {
      setState(() {
        _position = p;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Now Playing'),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(colors: [
      //         Color.fromARGB(255, 67, 162, 240),
      //         Color.fromARGB(255, 42, 56, 139),
      //       ]),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          // color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back),),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 100.0,
                      child:ArtWorkWidget(),

                    ),
                    const SizedBox(height: 30,),
                    Text(
                      widget.songModel.displayNameWOExt,
                      // overflow: TextOverflow.fade,
                      // maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      widget.songModel.artist.toString() == '<unknown>'
                          ? "Unknown Artist"
                          : widget.songModel.artist.toString(),
                      style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                            _position.toString().split(".")[0]
                        ),
                        Expanded(
                          child: Slider(
                              min:const Duration(microseconds: 0).inSeconds.toDouble(),
                              value: _position.inSeconds.toDouble(),
                              max:_duration.inSeconds.toDouble(),
                              onChanged: (value) {
                            setState(() {

                              changeToSeconds(value.toInt());
                              value = value;

                            });
                          }),
                        ),
                        Text(
                          _duration.toString().split(".")[0]
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [

                        IconButton(onPressed: () {
                          // if(widget.audioPlayer.hasPrevious){
                            widget.audioPlayer.seekToPrevious();
                          // }
                        },
                            icon: const Icon(Icons.skip_previous, size: 40,)),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if(_isPlaying){
                                widget.audioPlayer.pause();
                              }else{
                                widget.audioPlayer.play();
                              }
                              _isPlaying = ! _isPlaying;
                            });
                          },
                            icon: Icon(_isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,size: 40)),

                        IconButton(onPressed: () {
                          widget.audioPlayer.seekToNext();
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
      // body: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(colors: [
      //       Color.fromARGB(255, 67, 162, 240),
      //       Color.fromARGB(255, 42, 56, 139),
      //     ]),
      //
      //   ),
      //   child: Center(
      //     child: Column(
      //       children: [
      //         Container(
      //           width: 250,
      //           height: 250,
      //           margin: const EdgeInsets.only(top: 30),
      //           decoration: const BoxDecoration(
      //             borderRadius: BorderRadius.only(topRight: Radius.circular(150),
      //               topLeft: Radius.circular(150),bottomRight: Radius.circular(150),
      //               bottomLeft: Radius.circular(150),
      //             ),
      //             boxShadow:[
      //               BoxShadow(
      //                 color: Colors.grey,
      //                 spreadRadius: 10,
      //                 blurRadius: 20,
      //                 offset: Offset(0.0,0.0),
      //
      //               ),
      //             ],
      //             // color: Colors.white,
      //           ),
      //           child: const CircleAvatar(
      //             radius: 50,
      //             backgroundImage: AssetImage('assets/kitten.png'),
      //           ),
      //         ),
      //         const SizedBox(height: 20,),
      //         const Text('Apna Banale Le',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
      //         const SizedBox(height:5,),
      //         const Text('Trending song',style: TextStyle(fontSize: 15),),
      //         Container(
      //           width: 350,
      //           height: 150,
      //           margin: const EdgeInsets.only(top: 70),
      //           decoration: const BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.only(topRight: Radius.circular(50),
      //               topLeft: Radius.circular(50),bottomRight: Radius.circular(50),
      //               bottomLeft: Radius.circular(50),
      //             ),
      //             boxShadow:[
      //               BoxShadow(
      //                 color: Colors.grey,
      //                 spreadRadius: 5,
      //                 blurRadius: 10,
      //                 offset: Offset(0,3),
      //
      //               ),
      //             ],
      //             // color: Colors.white,
      //           ),
      //           child: const InkWell(
      //
      //           ),
      //
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
  void changeToSeconds(int seconds){
    Duration duration = Duration(seconds: seconds);
    widget.audioPlayer.seek(duration);
  }
}

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: context.watch<SongModelProvider>().id,
      type: ArtworkType.AUDIO,
      artworkWidth: 200,
      artworkHeight: 200,
      artworkFit: BoxFit.cover,
      nullArtworkWidget: const Icon(Icons.music_note, size: 200,),
    );
  }
}


