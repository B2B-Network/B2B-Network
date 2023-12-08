import 'package:base/profile.dart';
import 'package:flutter/material.dart';

import 'listPage.dart';
import 'notification.dart';
import 'searchPage.dart';

// Model class representing the post data
class Post {
  final int postId;
  final String username;
  final String imageUrl;
  final String caption;

  Post({
    required this.postId,
    required this.username,
    required this.imageUrl,
    required this.caption,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Use a List to store post data
  List<Post> posts = [];

  // Use a Map to store the liked state for each post
  Map<int, bool> likedPosts = {};

  // Method to fetch posts from the database (replace with your actual implementation)
  Future<List<Post>> fetchPosts() async {
    // Replace this with your logic to fetch posts from the database
    // For now, a dummy list is returned
    await Future.delayed(Duration(seconds: 2));
    return [
      Post(
          postId: 0,
          username: 'john_doe',
          imageUrl: 'assets/images/post1.jpeg',
          caption: 'Beautiful Handicraft bags'),
      Post(
          postId: 1,
          username: 'jane_doe',
          imageUrl: 'assets/images/post1.jpeg',
          caption: 'Beautiful Handicraft bags'),
      // Add more posts as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0245A3),
        title: Text("B2B Network"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while data is being fetched
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error case
            return Center(child: Text('Error loading posts'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Handle case where there are no posts
            return Center(child: Text('No posts available'));
          } else {
            // Populate the posts list with data from the database
            posts = snapshot.data!;
            return Container(
              color: Color(0xFFF6F1F1),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return _buildPost(
                    postId: posts[index].postId,
                    username: posts[index].username,
                    imageUrl: posts[index].imageUrl,
                    caption: posts[index].caption,
                  );
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        selectedItemColor: Color(0xFF0245A3),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildPost({
    required int postId,
    required String username,
    required String imageUrl,
    required String caption,
  }) {
    // Check if the post is liked
    bool isLiked = likedPosts[postId] ?? false;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info (profile image and username)
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                // Use a local image for the user profile
                backgroundImage: AssetImage('assets/images/dp.jpg'),
              ),
              SizedBox(width: 8),
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Mplus1p',
                ),
              ),
            ],
          ),
          // Caption
          SizedBox(height: 8),
          Text(
            caption,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Mplus1p',
            ),
          ),
          // Post image
          SizedBox(height: 8),
          Image.asset(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Like and Message icons
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      // Toggle the liked state
                      setState(() {
                        likedPosts[postId] = !isLiked;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  Text('Like'),
                ],
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Dummy class for the MessagePage, replace with your actual implementation
class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Center(
        child: Text('Message Page Content'),
      ),
    );
  }
}
