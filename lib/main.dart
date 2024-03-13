import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parashar App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
        backgroundColor: Colors.amberAccent,
      ),
      body: TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController _controller = TextEditingController();
  String _text = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeText(String text) {
    if (text == "hello world!") {
      _controller.clear();
      text = "";
    }
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message",
          ),
          onChanged: (text) => changeText(text),
        ),
        Text(_text),
      ],
    );
  }
}
