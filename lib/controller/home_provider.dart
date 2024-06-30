import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  String? name;
  String? email;
  String? bod;
  String? phone;
  String? password;

  void addData(
      {String? name, String? email, String? bod, String? phone, String? password}){
    this.name=name;
    this.email=email;
    this.bod=bod;
    this.phone=phone;
    this.password=password;
    notifyListeners();
  }


  MetasImage? simg;
  void sphoto({var img}){
    simg=img;
    notifyListeners();
  }
}
