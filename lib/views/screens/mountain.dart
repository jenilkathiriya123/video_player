import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Mountain extends StatefulWidget {
  const Mountain({Key? key}) : super(key: key);

  @override
  State<Mountain> createState() => _MountainState();
}

class _MountainState extends State<Mountain> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> video() async {
    videoPlayerController = VideoPlayerController.network(
        "https://assets.mixkit.co/videos/preview/mixkit-landscape-of-mountains-and-sunset-3128-large.mp4");

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
        title: Text("Mountain Video"),
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
