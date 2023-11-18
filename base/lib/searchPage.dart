import 'package:flutter/material.dart';

import 'homePage.dart';
import 'listPage.dart';
import 'notification.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0245A3),
        title: Text("B2B Network"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFFF6F1F1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchAnchor(
                        builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                          );
                        },
                        suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
                          return List<ListTile>.generate(5, (int index) {
                            final String item = 'Item $index';
                            return ListTile(
                              title: Text(item),
                              onTap: () {
                                setState(() {
                                  controller.closeView(item);
                                });
                              },
                            );
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: SearchAnchor(
                        builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            trailing: <Widget>[
                              IconButton(
                                onPressed: () {
                                  // Add location icon tap logic here
                                  // For example, show a location picker dialog or navigate to a map page
                                },
                                icon: const Icon(Icons.location_on),
                              ),
                            ],
                          );
                        },
                        suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
                          return List<ListTile>.generate(5, (int index) {
                            final String item = 'Location $index';
                            return ListTile(
                              title: Text(item),
                              onTap: () {
                                setState(() {
                                  controller.closeView(item);
                                });
                              },
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildImageWithText(
                    'assets/images/fnb.png',
                    'Items',
                    () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => FoodAndBeverages()));
                      // Add your logic here for when the image is tapped.
                      // For example, you can navigate to a specific page.
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourPage()));
                    },
                  ),
                  buildImageWithText(
                    'assets/images/fnb.png',
                    'Decoratives',
                    () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => decoratives()));
                      // Add your logic here for when the image is tapped.
                    },
                  ),
                  buildImageWithText(
                    'assets/images/fnb.png',
                    'Jewellery',
                    () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Jwellery()));
                    },
                  ),
                  buildImageWithText(
                    'assets/images/fnb.png',
                    'Others',
                    () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      //         others())); // Add your logic here for when the image is tapped.
                    },
                  ),
                ],
              ),
            ),
          ],
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
        currentIndex: 1,
        onTap: (int index) {
          switch (index) {
            case 0: // Index for the Home icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomePage(), // Replace with your home page
                ),
              );
              break;
            case 1: // Index for the Search icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              break;
            case 2: // Index for the Plus icon
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPage(),
                ),
              );
              break;
            case 3: // Index for the Notification icon
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

  Widget buildImageWithText(
      String imagePath, String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 100.0,
            height: 70.0,
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
