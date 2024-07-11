import 'package:flutter/material.dart';
import 'edit.dart';
import 'filmscan.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHovered1 = false;
  bool isHovered2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/menubg.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8), // Adjust this to position lower on the screen
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onEnter: (_) => setState(() => isHovered1 = true),
                  onExit: (_) => setState(() => isHovered1 = false),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => filmScan(initialIndex: 0)),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), // Rounded corners
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          border: isHovered1
                              ? Border.all(color: Colors.white70, width: 5.0)
                              : null,
                        ),
                        child: Image.asset(
                          'assets/images/fsbutton.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Spacing between the buttons
                MouseRegion(
                  onEnter: (_) => setState(() => isHovered2 = true),
                  onExit: (_) => setState(() => isHovered2 = false),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => editImage(initialIndex: 1)),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), // Rounded corners
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          border: isHovered2
                              ? Border.all(color: Colors.white70, width: 5.0)
                              : null,
                        ),
                        child: Image.asset(
                          'assets/images/ebutton.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
