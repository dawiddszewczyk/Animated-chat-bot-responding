import 'package:flutter/material.dart';
import 'typed.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _buttonPressed = false;
  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        _buttonPressed = true;
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }

    _loopActive = false;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 300,left: 20),
            child: _buttonPressed? Typed(): null
          ),
        ),
        floatingActionButton: Listener(
          onPointerDown: (details) {
            _buttonPressed = true;
            _increaseCounterWhilePressed();
          },
          onPointerUp: (details) {
            _buttonPressed = false;
          },
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
              });
            },
            child: Icon(Icons.call_to_action),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }

}