import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> video() async {
    videoPlayerController = VideoPlayerController.asset('assets/video/vk.mp4');

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
      appBar: AppBar(
        title: Text("Virat Kohli Video"),
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
