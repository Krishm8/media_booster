// ignore_for_file: prefer_const_constructors, unnecessary_import


import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:media_booster/view/video.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  late TabController tabController = TabController(length: 2, vsync: this);
  Audio? audio;

  @override
  void initState() {
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio(
          "assets/audio/295.mp3",
          metas: Metas(
            title: "295",
            artist: "Sidhu Moose Wala",
            image: MetasImage.asset("assets/images/s1.jpg"),
          ),
        ),
        Audio(
          "assets/audio/halki.mp3",
          metas: Metas(
            title: "halki",
            artist: "Sidhu Moose Wala",
            image: MetasImage.asset("assets/images/s2.jpg"),
          ),
        ),
        Audio(
          "assets/audio/soulmate.mp3",
          metas: Metas(
            title: "295",
            artist: "Sidhu Moose Wala",
            image: MetasImage.asset("assets/images/s3.jpg"),
          ),
        ),
        Audio(
          "assets/audio/sohighmp3",
          metas: Metas(
            title: "295",
            artist: "Sidhu Moose Wala",
            image: MetasImage.asset("assets/images/s4.jpg"),
          ),
        ),
        Audio(
          "assets/audio/295.mp3",
          metas: Metas(
            title: "295",
            artist: "Sidhu Moose Wala",
            image: MetasImage.asset("assets/images/s5.jpg"),
          ),
        ),
      ]),
      autoStart: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(text: "Audio"),
              Tab(text: "Video"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20,),
                    CarouselSlider(
                      items: List.generate(
                        assetsAudioPlayer.playlist?.audios.length ?? 0,
                            (index) {
                          audio = assetsAudioPlayer.playlist?.audios[index];
                          return Image.asset(
                            audio?.metas.image?.path ?? "",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeFactor: 0.3,
                          enlargeCenterPage: true,
                          autoPlayInterval: Duration(milliseconds: 1000)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${audio?.metas.title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          Text("♥",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 230,top: 10),
                      child: Text("${audio?.metas.artist}",style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(
                      height: 20
                    ),
                    StreamBuilder<Duration>(
                        stream: assetsAudioPlayer.currentPosition,
                        builder: (context, snapshot) {
                          Duration? currentDuration;
                          if (assetsAudioPlayer.current.hasValue) {
                            currentDuration = assetsAudioPlayer.current.value?.audio.duration;
                          }
                          return Opacity(
                            opacity: assetsAudioPlayer.current.hasValue ? 1 : 0.2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("${snapshot.data?.inMinutes ?? 0.0}:".padLeft(2, '0')),
                                      Text("${(snapshot.data?.inSeconds ?? 0.0) % 60}".padLeft(2, '0')),
                                      Expanded(
                                        child: Slider(
                                          value: snapshot.data?.inSeconds.toDouble() ?? 0,
                                          min: 0,
                                          max: currentDuration?.inSeconds.toDouble() ?? 1,
                                          onChanged: (value) {
                                            assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
                                          },
                                        ),
                                      ),
                                      Text(
                                          "${currentDuration?.inMinutes ?? 0.0}:${currentDuration?.inSeconds ?? 0.0}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 30,
                          onPressed: () {
                            assetsAudioPlayer.previous();
                          },
                          icon: Icon(Icons.skip_previous),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StreamBuilder<bool>(
                          stream: assetsAudioPlayer.isPlaying,
                          builder: (context, snapshot) {
                            bool isPlaying = snapshot.data ?? false;
                            return IconButton(
                              iconSize: 45,
                              onPressed: () {
                                assetsAudioPlayer.playOrPause();
                              },
                              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          iconSize: 30,
                          onPressed: () {
                            assetsAudioPlayer.next();
                          },
                          icon: Icon(Icons.skip_next),
                        ),
                      ],
                    ),
                  ],
                ),
                VideoDemo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


