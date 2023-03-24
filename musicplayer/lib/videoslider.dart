import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSlider extends StatefulWidget {
  @override
  _VideoSliderState createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  final List<VideoPlayerController> _videoPlayerControllers = [
    VideoPlayerController.network("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
    VideoPlayerController.network("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    VideoPlayerController.network("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
    VideoPlayerController.network("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"),
    VideoPlayerController.network("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
  ];
  late VideoPlayerController _selectedVideoController;
  @override
  void initState() {
    super.initState();
    _selectedVideoController = _videoPlayerControllers[0];
    _videoPlayerControllers.forEach((controller) => controller.initialize());
    _selectedVideoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing Video'),
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
        body:ListView.builder(
      itemCount: _videoPlayerControllers.length,
      itemBuilder: (context, index) {
        var controller = _videoPlayerControllers[index];
        return ListTile(
          onTap: () {
            setState(() {
              _selectedVideoController.pause();
              _selectedVideoController = controller;
              _selectedVideoController.play();
            });
          },
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        );
      },),
    );
  }

  @override
  void dispose() {
    _videoPlayerControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}