import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class Post{
  String body;
  String author;
  int likes=0;
  bool userLiked=false;

  Post(this.body,this.author);

  void likePost(){
    this.userLiked = !this.userLiked; //like lai unlike garne,vise-versa
    
    if(this.userLiked){
      this.likes +=1;
    
    }
    else{
      this.likes -=1;
    }
  }
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


class PostList extends StatefulWidget {
  

  final List<Post> listItems;
  PostList(this.listItems);
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback){
    this.setState(() {
      callback();
    });

  }
  
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context,index){
        var post = this.widget.listItems[index];
        return Card(
          child:Row(
            children: <Widget>[Expanded(child: ListTile(title: Text(post.body),subtitle: Text(post.author)),
            ),
            Row(children: <Widget>[
              Container(child: Text(post.likes.toString(),style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              IconButton(
                onPressed: ()=> this.like(post.likePost),
                icon: Icon(Icons.thumb_up),
                color: post.userLiked ? Colors.blue :Colors.black,
                
                )],)
            ],
          )
        );
      },
    );
  }
}