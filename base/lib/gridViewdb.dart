// Import necessary packages
import 'package:flutter/material.dart';

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    },
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    },
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    },
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    },
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    },
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    },
    {
      "name": "Veronica",
      "images": "assets/images/dp.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 310,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120, // Adjust the size as needed
                width: 120, // Adjust the size as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF0245A3), width: 3.0),
                ),
                child: ClipOval(
                  child: Image.asset(
                    "${gridMap.elementAt(index)['images']}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['name']}",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0, // Adjust the font size as needed
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your connect button logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0245A3), // Set the button color
                      ),
                      child: Text(
                        "Connect",
                        style: TextStyle(
                          fontFamily: 'Mplus1p',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
