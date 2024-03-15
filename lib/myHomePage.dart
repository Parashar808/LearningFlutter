import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text){
    this.setState(() {
     posts.add(new Post(text, "Parashar"));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Hobbies'),
        backgroundColor: Colors.amberAccent,
      ),
      body:Column(children:<Widget>[
       Expanded(child:PostList(this.posts)),
       TextInputWidget(this.newPost)
       ])
    );
  }
}