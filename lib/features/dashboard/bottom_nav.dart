import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          width: 1.2,
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: 2,
        elevation: 0,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              child: Icon(
                FeatherIcons.home,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              child: Icon(
                FeatherIcons.checkCircle,
              ),
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              child: Icon(
                FeatherIcons.users,
              ),
            ),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              child: Icon(
                FeatherIcons.settings,
              ),
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              child: Icon(
                FeatherIcons.helpCircle,
              ),
            ),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
