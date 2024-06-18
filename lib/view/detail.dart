// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'dart:ui';

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
          "assets/audio/Invincible.mp3",
          metas: Metas(
            artist: "smw Moose Wala",
            title: "Invincible",
            image: MetasImage.asset("assets/images/s2.jpg"),
          ),
        ),
        Audio(
          "assets/audio/Goat.mp3",
          metas: Metas(
            artist: " Moose Wala",
            title: "Goat",
            image: MetasImage.asset("assets/images/s3.jpg"),
          ),
        ),
        Audio(
          "assets/audio/sohigh.mp3",
          metas: Metas(
            artist: "Sidhu Moose Wala",
            title: "sohigh",
            image: MetasImage.asset("assets/images/s4.jpg"),
          ),
        ),
        Audio(
          "assets/audio/MeraNa.mp3",
          metas: Metas(
            artist: "Sidhu Moose Wala",
            title: "MeraNa",
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
                Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/images/s5.jpg",
                            // audio?.metas.image?.path ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            color: Colors.black.withOpacity(1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
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
                            aspectRatio: 1.5,
                              autoPlay: true,
                              enlargeFactor: 0.3,
                              enlargeCenterPage: true,
                              autoPlayInterval: Duration(milliseconds: 1000)),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        StreamBuilder<Duration>(
                            stream: assetsAudioPlayer.currentPosition,
                            builder: (context, snapshot) {
                              Duration? currentDuration;
                              if (assetsAudioPlayer.current.hasValue) {
                                currentDuration = assetsAudioPlayer
                                    .current.value?.audio.duration;
                              }
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "${assetsAudioPlayer.getCurrentAudioArtist}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${assetsAudioPlayer.getCurrentAudioTitle}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${snapshot.data?.inMinutes ?? 0.0}:"
                                              .padLeft(2, '0'),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${(snapshot.data?.inSeconds ?? 0.0) % 60}"
                                              .padLeft(2, '0'),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Expanded(
                                          child: Slider(
                                            activeColor: Colors.white,
                                            inactiveColor: Colors.white38,
                                            value: snapshot.data?.inSeconds
                                                    .toDouble() ??
                                                0,
                                            min: 0,
                                            max: currentDuration?.inSeconds
                                                    .toDouble() ??
                                                1,
                                            onChanged: (value) {
                                              assetsAudioPlayer.seek(
                                                Duration(
                                                  seconds: value.toInt(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Text(
                                          "${currentDuration?.inMinutes ?? 0.0}:${currentDuration?.inSeconds ?? 0.0}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                              icon: Icon(
                                Icons.skip_previous,
                                color: Colors.white60,
                              ),
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
                                  icon: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white),
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              iconSize: 30,
                              onPressed: () {
                                assetsAudioPlayer.next();
                              },
                              icon: Icon(
                                Icons.skip_next,
                                color: Colors.white60,
                              ),
                            ),
                          ],
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
