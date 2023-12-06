import 'package:flutter/material.dart';

import 'followerPage.dart';
import 'followingPage.dart';
import 'homePage.dart';
import 'listPage.dart';
import 'notification.dart';
import 'searchPage.dart';
import 'update.dart';

// Replace with your actual data fetching function
Future<Map<String, int>> fetchFollowCounts() async {
  // Simulating data fetching from a database
  // Replace this with your actual database call
  await Future.delayed(Duration(seconds: 2));
  return {'followers': 200, 'following': 100};
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

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Circular profile picture
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 150),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/dp.jpg'),
                      ),
                    ),
                    // User name
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 150),
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
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigate to the Following page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FollowingPage(),
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
                                  builder: (context) => FollowerPage(),
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          'Social media Accounts: ',
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
                                    builder: (context) => UpdatePage()));
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
                          onPressed: () {},
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
}
