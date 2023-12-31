import 'package:flutter/material.dart';

import 'followingNFollowerPage.dart';
import 'homePage.dart';
import 'listPage.dart';
import 'notification.dart';
import 'searchPage.dart';
import 'update.dart';
import 'package:url_launcher/url_launcher.dart';

// Replace with your actual data fetching function
Future<Map<String, int>> fetchFollowCounts() async {
  // Simulating data fetching from a database
  // Replace this with your actual database call
  await Future.delayed(Duration(seconds: 2));
  return {'followers': 200, 'following': 100};
}

class Post {
  final int postId;
  final String imageUrl;
  final String caption;

  Post({required this.postId, required this.imageUrl, required this.caption});
}

// Replace with your actual data fetching function
Future<List<Post>> fetchUserPosts() async {
  // Simulating data fetching from a database
  // Replace this with your actual database call
  await Future.delayed(Duration(seconds: 2));
  return [
    Post(
        postId: 0,
        imageUrl: 'assets/images/post1.jpeg',
        caption: 'Beautiful Handicraft bags'),
    Post(
        postId: 1,
        imageUrl: 'assets/images/post1.jpeg',
        caption: 'Amazing artwork'),
    // Add more posts as needed
  ];
}

class UserPosts extends StatelessWidget {
  final List<Post> posts;

  UserPosts({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Your Posts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(posts[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(posts[index].caption),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.offline_bolt, color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Edit'),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                        ],
                        child: Icon(Icons.more_vert, size: 28),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0245A3),
        title: Text("B2B Network"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: FutureBuilder<Map<String, int>>(
            future: fetchFollowCounts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No data available');
              } else {
                final followersCount = snapshot.data!['followers'];
                final followingCount = snapshot.data!['following'];

                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Circular profile picture
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/dp.jpg'),
                          ),
                        ),
                        // User name
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            'User Name', // Replace with the actual user name
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Following and followers count
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigate to the Following page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FollowingNFollowerPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Following: $followingCount',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              InkWell(
                                onTap: () {
                                  // Navigate to the Followers page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FollowingNFollowerPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Followers: $followersCount',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),

                        // Rest of the profile information and buttons

                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            child: Text(
                              'Name: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Mplus1p',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            child: Text(
                              'City: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Mplus1p',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            child: Text(
                              'State: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Mplus1p',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            child: Text(
                              'Country: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Mplus1p',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            child: Text(
                              'Services: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Mplus1p',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Social Media Accounts: ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Mplus1p',
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SocialMediaIcon(
                                  iconAsset: 'assets/icons/linkedin.png',
                                  onTap: () {
                                    // Handle the link to the LinkedIn profile
                                    _launchSocialMedia(
                                        'https://www.linkedin.com/');
                                  },
                                ),
                                SizedBox(width: 10),
                                SocialMediaIcon(
                                  iconAsset: 'assets/icons/twitter.png',
                                  onTap: () {
                                    // Handle the link to the Twitter profile
                                    _launchSocialMedia('https://twitter.com/');
                                  },
                                ),
                                SizedBox(width: 10),
                                SocialMediaIcon(
                                  iconAsset: 'assets/icons/instagram.png',
                                  onTap: () {
                                    // Handle the link to the Instagram profile
                                    _launchSocialMedia(
                                        'https://www.instagram.com/');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // ... (other profile information)
                        SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: 150,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0245A3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdatePage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontFamily: 'Mplus1p',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        // User Posts
                        FutureBuilder<List<Post>>(
                          future: fetchUserPosts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData) {
                              return Text('No posts available');
                            } else {
                              return UserPosts(posts: snapshot.data!);
                            }
                          },
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0245A3),
                          ),
                          onPressed: () {
                            // Log out logic
                            // You can add your log out functionality here
                          },
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              fontFamily: 'Mplus1p',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
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
          // Add navigation logic for the bottom navigation items here
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

  void _launchSocialMedia(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SocialMediaIcon extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;

  SocialMediaIcon({required this.iconAsset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        iconAsset,
        width: 40,
        height: 40,
      ),
    );
  }
}
