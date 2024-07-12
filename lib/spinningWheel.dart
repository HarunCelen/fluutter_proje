import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key}) : super(key: key);
  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();
  String text = "sa";
  final selected = BehaviorSubject<int>();
  List<String> item = [
    "le",
    "el",
    "ele",
    "elle",
    "ela",
    "lale",
    "ala",
    "ekle",
    "kelek",
    "kalk",
    "keke",
    "elekle",
    "keklik"
  ];
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('tr-Tr');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          SizedBox(
            height: 300,
            child: FortuneWheel(
              selected: selected.stream,
              animateFirst: false,
              items: [
                for (int i = 0; i < item.length; i++) ...<FortuneItem>{
                  FortuneItem(child: Text(item[i].toString())),
                },
              ],
              onAnimationEnd: () {
                setState(() {
                  text = item[selected.value];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Kelime" + text)),
                  );
                });
                print(text);
                // speak(text);
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected.add(Fortune.randomInt(0, item.length));
              });
            },
            child: Container(
              height: 40,
              width: 120,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Text("Çevir"),
              ),
            ),
          )
        ])));
  }
}
