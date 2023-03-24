import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class vedioOne extends StatefulWidget {
  const vedioOne({Key? key}) : super(key: key);

  @override
  State<vedioOne> createState() => _vedioOneState();
}
class _vedioOneState extends State<vedioOne> {
  late VideoPlayerController _controller;
  late Future<void> _initiazeVideoPlayerFuture;
    //
    @override
    void initState() {
      _controller = VideoPlayerController.asset(
          'video/minions.mp4');
      _initiazeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _controller.setVolume(1.0);
      super.initState();
    }
    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const Text("Tap the below Button to \nplay or pause the song",style: TextStyle(color: Colors.white,fontSize: 20,),),
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

        margin: const EdgeInsets.only(top: 200),
      child:FutureBuilder(
        future: _initiazeVideoPlayerFuture,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return AspectRatio(aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();
            }else{
              _controller.play();
            }
          });
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,),
      ),

    );
  }
}
