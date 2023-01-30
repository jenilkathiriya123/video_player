import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class flower extends StatefulWidget {
  const flower({Key? key}) : super(key: key);

  @override
  State<flower> createState() => _flowerState();
}

class _flowerState extends State<flower> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> video() async {
    videoPlayerController = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");

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
        title: Text("Flower Video"),
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
