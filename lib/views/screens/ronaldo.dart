import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Ronaldo extends StatefulWidget {
  const Ronaldo({Key? key}) : super(key: key);

  @override
  State<Ronaldo> createState() => _RonaldoState();
}

class _RonaldoState extends State<Ronaldo> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> video() async {
    videoPlayerController = VideoPlayerController.asset('assets/video/cr7.mp4');

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
        title: Text("Ronaldo Video"),
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
