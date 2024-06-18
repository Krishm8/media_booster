import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatefulWidget {
  const VideoDemo({super.key});

  @override
  State<VideoDemo> createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  List<String> videos = [
    "https://cdn.pixabay.com/video/2024/06/06/215500_large.mp4",
    "https://cdn.pixabay.com/video/2023/08/01/174086-850404739_large.mp4",
    "https://cdn.pixabay.com/video/2022/11/26/140521-775376205_tiny.mp4"
  ];

  @override
  void initState() {
    super.initState();
    playNetworkVideo("https://cdn.pixabay.com/video/2024/06/06/215500_large.mp4");
  }

  void playNetworkVideo(String path) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(path));
    videoPlayerController.initialize().then((value) {
      setState(() {});
    });
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: chewieController,
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        playNetworkVideo(videos[index]);
                      },
                      child: Container(
                        height: 100,
                        width: 200,
                        margin: EdgeInsets.only(top: 10,left: 20),
                        color: Colors.black12,
                        child: Center(child: Text("Video ${index + 1}")),
                      ),
                    );
                  },
                  itemCount: videos.length),
            ),
          ],
        ),
      ),
    );
  }
}