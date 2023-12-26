import 'package:flutter/material.dart';

import 'listPage.dart';
import 'notification.dart';
import 'searchPage.dart';
import 'userProfilePage.dart'; // Update this import statement

class FollowingNFollowerPage extends StatefulWidget {
  const FollowingNFollowerPage({super.key});

  @override
  State<FollowingNFollowerPage> createState() => _FollowingNFollowerPageState();
}

class _FollowingNFollowerPageState extends State<FollowingNFollowerPage> {
  List<Map<String, dynamic>> followingList = [
    {'name': 'User 1', 'profileImage': 'assets/profile_image1.jpg'},
    {'name': 'User 2', 'profileImage': 'assets/profile_image2.jpg'},
    // Add more users as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
      ),
      body: ListView.builder(
        itemCount: followingList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(followingList[index]['profileImage']),
            ),
            title: Text(followingList[index]['name']),
            onTap: () {
              // Navigate to the user's profile page and pass the user data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(
                    userName: followingList[index]['name'],
                    profileImage: followingList[index]['profileImage'],
                  ),
                ),
              );
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
    ;
  }
}
