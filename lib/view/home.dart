// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controller/home_provider.dart';
import 'package:media_booster/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Audio? audio;

  @override
  void initState() {
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio(
          "assets/audio/295.mp3",
          metas: Metas(
            title: "295",
            image: MetasImage.asset("assets/images/s1.jpg"),
          ),
        ),
        Audio(
          "assets/audio/sohigh.mp3",
          metas: Metas(
            title: "halki",
            image: MetasImage.asset("assets/images/s2.jpg"),
          ),
        ),
        Audio(
          "assets/audio/soulmate.mp3",
          metas: Metas(
            title: "295",
            image: MetasImage.asset("assets/images/s3.jpg"),
          ),
        ),
        Audio(
          "assets/audio/295.mp3",
          metas: Metas(
            title: "295",
            image: MetasImage.asset("assets/images/s4.jpg"),
          ),
        ),
        Audio(
          "assets/audio/295.mp3",
          metas: Metas(
            title: "295",
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
      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${Provider.of<HomeProvider>(context, listen: false).name}",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "${Provider.of<HomeProvider>(context, listen: false).email}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Profile"),
            trailing: Icon(Icons.navigate_next),
          ),
          Consumer<ThemeProvider>(
            builder:
                (BuildContext context, ThemeProvider value, Widget? child) {
              return InkWell(
                onTap: () {
                  value.changeTheme();
                },
                child: ListTile(
                  title: Text("Theme"),
                  trailing: Icon((value.theme==ThemeMode.light)?Icons.light_mode:Icons.dark_mode),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Favorites"),
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi! ${Provider.of<HomeProvider>(context, listen: false).name}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "What you want to hear today?",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: List.generate(
                assetsAudioPlayer.playlist?.audios.length ?? 0,
                (index) {
                  var audio = assetsAudioPlayer.playlist?.audios[index];
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
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "Most Listened",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  assetsAudioPlayer.playlist?.audios.length ?? 0,
                  (index) {
                    audio = assetsAudioPlayer.playlist?.audios[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "detail");
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10, right: 10),
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          audio?.metas.image?.path ?? "",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Popular Artist 2024",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "detail");
                },
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 10),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 10),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, right: 10, bottom: 15),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s3.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 10),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s4.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 10),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s5.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, right: 10, bottom: 15),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 10),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 10),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s3.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, right: 10, bottom: 15),
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/s4.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Provider.of<ThemeProvider>(context, listen: false)
                  .changeTheme();
 */
