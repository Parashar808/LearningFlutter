import 'package:flutter/material.dart';

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
      FocusScope.of(context).unfocus();



  }

   @override
  Widget build(BuildContext context) {
    return 
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type stuffs",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.amber[600],
              tooltip: "Post this Stuff!",
              onPressed: this.click,
            ))    
    );
  }
}