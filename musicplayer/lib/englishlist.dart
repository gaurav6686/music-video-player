import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class englishList extends StatefulWidget {
  const englishList({Key? key}) : super(key: key);


  @override
  State<englishList> createState() => _englishListState();
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


class _englishListState extends State<englishList> {

  List musicList = [
    {
      "title": "Shape of You",
      "artist": "Ed Sheeran",
      "cover":
      "https://is4-ssl.mzstatic.com/image/thumb/Video126/v4/88/70/e9/8870e976-1d4e-0ed6-d5a1-02cc6183558c/Job3b60a129-8c0d-4179-b6ec-903b71bf1b18-129193526-PreviewImage_preview_image_nonvideo_sdr-Time1645812297481.png/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/1b/58/57/1b5857b8-e22a-7eb0-5f63-5c9f6832ed74/mzaf_9687830336732132546.plus.aac.p.m4a",
    },
    {
      "title": "Memories",
      "artist": "Marron",
      "cover":
      "https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/22/58/58/225858c4-ef47-2b91-723a-47af3e99699a/19UMGIM64502.rgb.jpg/316x316bb.webp",
      "url":
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/43/6b/d6/436bd6a3-cb6f-52a8-82fd-717cc757c40c/mzaf_6838852637699393924.plus.aac.p.m4a",
    },
    {
      "title": "Dance with Me",
      "artist": "Ahjay Stelino",
      "cover":
      "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
      "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "Alejandro Magaña",
      "cover":
      "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "Ahjay Stelino",
      "cover":
      "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3",
    },
    {
      "title": "Life is a Dream",
      "artist": "Michael Ramir",
      "cover":
      "https://images.pexels.com/photos/1884306/pexels-photo-1884306.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
      "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
    },
    {
      "title": "Feeling Happy",
      "artist": "Ahjay Stelino",
      "cover":
      "https://images.pexels.com/photos/2682877/pexels-photo-2682877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
      "https://assets.mixkit.co/music/preview/mixkit-feeling-happy-5.mp3",
    },
    {
      "title": "Dance with Me",
      "artist": "Ahjay Stelino",
      "cover":
      "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
      "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "Alejandro Magaña",
      "cover":
      "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "Ahjay Stelino",
      "cover":
      "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
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
        title: const Text('Play English Songs'),
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
                child: Container(

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
                                  const englishPlay()),);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class englishPlay extends StatefulWidget {
  const englishPlay({Key? key}) : super(key: key);

  @override
  State<englishPlay> createState() => _englishPlayState();
}

class _englishPlayState extends State<englishPlay> {

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
    );
  }

  void changeToSecond(int seconds) {
    Duration duration = Duration(seconds: seconds);
    _audioPlayer.seek(duration);
  }
}





