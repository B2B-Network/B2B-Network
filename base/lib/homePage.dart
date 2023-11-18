import 'package:base/listPage.dart';
import 'package:base/notification.dart';
import 'package:base/searchPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              // Add navigation logic for the message icon here
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            // Add navigation logic for the profile icon here
          },
        ),
      ),
      body: Container(
        color: Color(0xFFF6F1F1),
        child: Center(
          child: Text("Home Page Content"),
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
        currentIndex: 0, // Set the initial selected tab index
        onTap: (int index) {
          // Add navigation logic for the bottom navigation items here
          // You can use a switch statement or if conditions based on the index
          switch (index) {
            case 1: // Index for the Search icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SearchPage(), // Replace with your search page
                ),
              );
              break;
            case 2: // Index for the Plus icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListPage(), // Replace with your "Plus" page
                ),
              );
              break;
            case 3: // Index for the Notification icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NotificationPage(), // Replace with your notification page
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
