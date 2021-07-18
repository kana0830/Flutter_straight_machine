import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:soundpool/soundpool.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _texts = [
    "おめでとうございます",
    "合格です",
    "よくできました",
    "残念でした",
    "不合格です",
    "頑張りましょう",
  ];

  List<int> _soundIds = [0, 0, 0, 0, 0, 0];

  //Null safety対応
  //https://dart.dev/null-safety
  Soundpool? _soundpool;

  @override
  void initState() {
    super.initState();
    _initSounds();
    print("initState終わったで〜＝buildメソッド回ったで〜");
  }

  Future<void> _initSounds() async {
    try {
      //Soundpoolのコンストラクタはバージョン2.1.0以降は非推奨
      //_soundpool = Soundpool();
      _soundpool = Soundpool.fromOptions();

      _soundIds[0] = await loadSound("assets/sounds/sound1.mp3");
      _soundIds[1] = await loadSound("assets/sounds/sound2.mp3");
      _soundIds[2] = await loadSound("assets/sounds/sound3.mp3");
      _soundIds[3] = await loadSound("assets/sounds/sound4.mp3");
      _soundIds[4] = await loadSound("assets/sounds/sound5.mp3");
      _soundIds[5] = await loadSound("assets/sounds/sound6.mp3");

      print("soundIds: $_soundIds");

      print("initSounds終わったで〜＝効果音ロードできたで〜");
      //やっぱりsetStateしないとダメ
      setState(() {});
    } on IOException catch (error) {
      print("エラーの内容は：$error");
    }
  }

  Future<int> loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) {
      if (_soundpool != null) {
        return _soundpool!.load(value);
      } else {
        return 0;
      }
      //return _soundpool?.load(value);
    });
  }

  @override
  void dispose() {
    _soundpool?.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 1, child: _soundButton(_texts[0], _soundIds[0])),
                    Expanded(
                        flex: 1, child: _soundButton(_texts[1], _soundIds[1])),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 1, child: _soundButton(_texts[2], _soundIds[2])),
                    Expanded(
                        flex: 1, child: _soundButton(_texts[3], _soundIds[3])),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 1, child: _soundButton(_texts[4], _soundIds[4])),
                    Expanded(
                        flex: 1, child: _soundButton(_texts[5], _soundIds[5])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _soundButton(String displayText, int soundId) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.brown,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        onPressed: () => _playSound(soundId),
        child: Text(displayText),
      ),
    );
  }

  void _playSound(int soundId) {
    _soundpool?.play(soundId);
    print("soundId: $soundId");
  }
}
