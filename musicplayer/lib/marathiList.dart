import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class marathiList extends StatefulWidget {
  const marathiList({Key? key}) : super(key: key);


  @override
  State<marathiList> createState() => marathiListState();
}

String currentTitle = "";
String currentArtist = "";
String currentCover = "";
String currentSong = "";

IconData btnIcon = Icons.play_arrow;

final AudioPlayer _audioPlayer = AudioPlayer();
bool isPlaying = false;

// Duration _duration = const Duration();
// Duration _position = const Duration();


class marathiListState extends State<marathiList> {

  List musicList = [
    {
      "title": "Zingat",
      "artist": "Ajay Gogavale & Atul Gogavale",
      "cover":
      "https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/f1/49/50/f14950ad-d0b4-ff92-082b-3824c32f0dc7/8718857700166.png/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/76/aa/ab/76aaabff-12b3-799f-2336-bc59302a6fbd/mzaf_8760629878289613775.plus.aac.p.m4a",
    },
    {
      "title": "Kombadi Palali",
      "artist": "Anand shinde,vaishali samant",
      "cover":
      "https://is5-ssl.mzstatic.com/image/thumb/Music/v4/81/ac/9d/81ac9df9-f258-8999-9b46-36712c021004/cover.jpg/88x88bb.jpg",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/2c/d1/8b/2cd18b19-045e-6582-7b8b-f918a9b9a227/mzaf_11634717806186057612.plus.aac.p.m4a",
    },
    {
      "title": "Maan Udhan Varyache",
      "artist": "Shankar-Mahajan",
      "cover":
      "https://is3-ssl.mzstatic.com/image/thumb/Music112/v4/d6/3a/3a/d63a3a94-76ea-8ed5-668b-0d8556f65e5f/195081652986.jpg/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/1a/29/0f/1a290f2d-e64c-c7c1-b379-538e99b8684e/mzaf_5743101988084039641.plus.aac.p.m4a",
    },
    {
      "title": "Chaam-Chaam Karta",
      "artist": "vaishali samant",
      "cover":
      "https://is3-ssl.mzstatic.com/image/thumb/Music112/v4/b8/2a/a7/b82aa768-5a64-979d-b4bd-2b3367164b53/8905778432898.jpg/316x316bb.webp",
      "url": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/ab/e9/03/abe903c9-bc0c-40ab-a2da-39d23c1f3fdb/mzaf_9723119996406472823.plus.aac.p.m4a",
    },
    {
      "title": "Chandra",
      "artist": "Shreya Ghoshal & Ajay-Atul",
      "cover":
      "https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/46/07/0f/46070f21-a1d8-251c-a29a-a5f2b1eeaf7e/cover.jpg/316x316bb.webp",
      "url": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/a3/7e/6f/a37e6fa3-cc4f-04ab-8223-9d9475bc9262/mzaf_12884090633045836416.plus.aac.p.m4a",
    },
    {
      "title": "Chhatrapati Shivaji Maharaj Mashup",
      "artist": "Ns Production Dj-abhishek",
      "cover":
      "https://is5-ssl.mzstatic.com/image/thumb/Music126/v4/95/0b/31/950b313c-4c6b-a44e-b58b-386abec9f11d/198003176539.jpg/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/a8/00/62/a8006221-0bc6-d7cb-2ec8-0441e2482a4e/mzaf_5140029990168505648.plus.aac.p.m4a",
    },
    {
      "title": "Lagnalu",
      "artist": "Kaustubh Gaikwad",
      "cover":
      "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/3c/8f/0b/3c8f0ba4-deb4-8c8a-1558-56b3da83aef2/8718857705321.png/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/d2/90/16/d29016d8-5c26-54b1-a181-0916fbba22b3/mzaf_7330007238106192288.plus.aac.p.m4a",
    },
    {
      "title": "Ararara",
      "artist": "Narendra Bhide",
      "cover":
      "https:https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/49/1f/66/491f6644-e425-77cc-b2e8-5ae3bd955662/8718857672401.png/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/18/62/50/186250b9-7e02-071d-99d2-908a0fb59d98/mzaf_15346001282732325507.plus.aac.p.m4a",
    },
    {
      "title": "Raghu Pinjryat Ala",
      "artist": "Mughda Karhade",
      "cover":
      "https://is2-ssl.mzstatic.com/image/thumb/Music122/v4/f4/71/77/f4717732-5d00-b960-31f2-f0bfacf77dd0/cover.jpg/316x316bb.webp",
      "url": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/ce/22/d7/ce22d73d-92a2-050c-aea5-4e42f0435825/mzaf_11218417582828907016.plus.aac.p.m4a",
    },
    {
      "title": "Jagnyala Pankh Futale",
      "artist": "Onkarswaroop, Anwessha.",
      "cover":
      "https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/e3/b5/69/e3b5695a-9b10-e700-5d6d-59fab515048f/cover.jpg/316x316bb.webp",
      "url": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/97/b5/4b/97b54b4a-403e-4fa5-9520-0f529ec442f1/mzaf_4552400803544404444.plus.aac.p.m4a",
    },
  ];


  playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      _audioPlayer.pause();

      if (_audioPlayer.play(UrlSource(url)) == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      // int result = await _audioPlayer.play(url);
      if (_audioPlayer.play(UrlSource(url)) == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }

    // _audioPlayer.onDurationChanged.listen((d) {
    //   setState(() {
    //     _duration = d;
    //   });
    // });
    //
    // _audioPlayer.onPositionChanged.listen((p) {
    //   setState(() {
    //     _position = p;
    //   });
    // });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Marathi Songs'),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueAccent, Colors.black]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: musicList.length,
                  itemBuilder: (context, index) =>
                      InkWell(
                        onTap: () {
                          playMusic(musicList[index]["url"]);
                          setState(() {
                            currentTitle = musicList[index]["title"];
                            currentArtist = musicList[index]["artist"];
                            currentCover = musicList[index]["cover"];
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const marathiPlay()),);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              musicList[index]["cover"],
                            ),
                          ),
                          title: Text(
                            musicList[index]["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          subtitle: Text(
                            musicList[index]["artist"],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.all(17.0),
                            child: const Icon(
                              Icons.music_note,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class marathiPlay extends StatefulWidget {
  const marathiPlay({Key? key}) : super(key: key);

  @override
  State<marathiPlay> createState() => marathiPlayState();
}

class marathiPlayState extends State<marathiPlay> {

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String formateTime(int seconds){
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8,'0');
  }

  @override
  void initState(){
    //  TODO: implement initState
    super.initState();

    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        _position=newPosition;
      });
    });
  }

  playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      _audioPlayer.pause();
      if (_audioPlayer.play(UrlSource(url)) == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      // int result = await _audioPlayer.play(url);
      if (_audioPlayer.play(UrlSource(url)) == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }

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
          child: Container(
    color: Colors.green,
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Column(
                  children: [

                    CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage(currentCover),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      currentTitle,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentArtist,
                      style: const TextStyle(fontSize: 20),
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

                          child: Slider(min: 0, max: _duration.inSeconds
                              .toDouble(), value: _position.inSeconds
                              .toDouble(),onChanged:(value) {
                            final _position = Duration(seconds: value.toInt());
                            _audioPlayer.seek(_position);
                            _audioPlayer.resume();
                          },),

                        ),
                        // Text("${_duration.inMinutes}:${_duration.inSeconds
                        //     .remainder(60)}"),
                        Text(formateTime((_duration-_position).inSeconds)),
                      ],

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              // if(_audioPlayer.){
                              // widget.audioPlayer.seekToPrevious();
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
                              _audioPlayer.resume();
                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = true;
                              });
                            }
                          },
                          icon: Icon(btnIcon, size: 40,),
                          // icon: Icon(
                          //     isPlaying ? Icons.pause : Icons.play_arrow,
                          //     size: 40)
                        ),
                        IconButton(
                            onPressed: () {
                              // _audioPlayer.hasNext
                              //     _audioPlayer.seekToNext()
                              //     : null;
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
      ),
    );
  }

  void changeToSecond(int seconds) {
    Duration duration = Duration(seconds: seconds);
    _audioPlayer.seek(duration);
  }
}





