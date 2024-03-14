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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text="";

  void ChangeText(String text){
    this.setState(() {
      this.text=text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
        backgroundColor: Colors.amberAccent,
      ),
      body:Column(children:<Widget>[TextInputWidget(this.ChangeText),Text(this.text)])
    );
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);
  
  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void click(){
      widget.callback(_controller.text);
      _controller.clear();



  }

   @override
  Widget build(BuildContext context) {
    return 
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.amber[600],
              tooltip: "Post Message!",
              onPressed: this.click,
            ))    
    );
  }
}
