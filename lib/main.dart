import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "エラーはありません";
  String _input = "10";

  void _handleErrors() {
    int? convertedNumber;

    try {
      convertedNumber = int.parse(_input);
      setState(() {
        _message = "変換した数字は: $convertedNumber";
      });
    } on FormatException catch (error) {
      setState(() {
        _message = "FormatException 数字に変換できませんでした: ${error.message}";
      });
    } finally {
      print("finally 変換処理が終了しました");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("エラーハンドリングの例"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('状態：$_message'),
            ElevatedButton(
                onPressed: _handleErrors,
                child: Text('数字を解析')
            ),
          ],
        ),
      ),
    );
  }
}
