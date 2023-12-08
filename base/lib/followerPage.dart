import 'package:flutter/material.dart';

import 'listPage.dart';
import 'notification.dart';
import 'searchPage.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({Key? key}) : super(key: key);

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  // Replace this with the actual list of followers from your database
  List<Map<String, dynamic>> followersList = [
    {'name': 'Follower 1', 'profileImage': 'assets/profile_image1.jpg'},
    {'name': 'Follower 2', 'profileImage': 'assets/profile_image2.jpg'},
    // Add more followers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: ListView.builder(
        itemCount: followersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(followersList[index]['profileImage']),
            ),
            title: Text(followersList[index]['name']),
            onTap: () {
              // Add logic for tapping on a follower, e.g., navigate to the follower's profile
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => FollowerProfilePage(),
              //   ),
              // );
            },
          );
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
}
