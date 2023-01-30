import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class burj extends StatefulWidget {
  const burj({Key? key}) : super(key: key);

  @override
  State<burj> createState() => _burjState();
}

class _burjState extends State<burj> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> video() async {
    videoPlayerController = VideoPlayerController.asset('assets/video/video.mp4');

    await videoPlayerController.initialize().then((value) => setState(() {}));
    // setState(() {});
    chewieController = ChewieController(
        videoPlayerController: (videoPlayerController), autoPlay: false);
  }

  @override
  void initState() {
    super.initState();
    video();
  }

  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Burj Khalifa Video"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: chewieController != null
              ? Chewie(controller: chewieController!)
              : Container(),
        ),
      ),
    );
  }
}
