import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> _texts = [
    "おめでとうございます",
    "合格です",
    "よくできました",
    "残念です",
    "不合格です",
    "頑張りましょう"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[0])),
                  Expanded(flex: 1, child: _soundButton(_texts[1])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[2])),
                  Expanded(flex: 1, child: _soundButton(_texts[3])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[4])),
                  Expanded(flex: 1, child: _soundButton(_texts[5])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: null,
          child: Text(displayText)
      ),
    );
  }




}
