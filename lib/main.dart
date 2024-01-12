import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: Column(
        children: [
          // Display a list of posts
          Expanded(
            child: PostList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder data for posts
    List<String> posts = [
      'Post 1',
      'Post 2',
      'Post 3',
      // Add more posts
    ];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(posts[index]);
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final String post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information (profile picture, username, etc.)
          Row(
            children: [
              CircleAvatar(
                // User's profile picture
                radius: 20,
                backgroundColor: Colors.grey,
                // Replace with user's profile picture
              ),
              SizedBox(width: 8),
              Text(
                'Username', // Replace with the actual username
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Post image
          Image.asset(
            'assets/post_image.jpg', // Replace with the post image
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          // Post actions (like, comment, share)
          Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 8),
              Icon(Icons.mode_comment_outlined),
              SizedBox(width: 8),
              Icon(Icons.send),
            ],
          ),
          SizedBox(height: 8),
          // Post caption and comments
          Text(
            post,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Add comments section if needed
        ],
      ),
    );
  }
}
