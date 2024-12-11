import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<Color> _colorStreamController = StreamController<Color>();

  Color _currentColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _colorStreamController.stream.listen((newColor) {
      setState(() {
        _currentColor = newColor;
      });
    });
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter カウンターアプリ'),
      ),
      body: Center(
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 200,
            height: 200,
            color: _currentColor
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final newColor = _generateRandomColor();
            _colorStreamController.sink.add(newColor);
          },
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
