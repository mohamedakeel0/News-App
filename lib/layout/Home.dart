import 'package:flutter/material.dart';
class Myhomepage extends StatelessWidget {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {

      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.check_circle_outline,
          ),
          label: 'Done',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.archive_outlined,
          ),
          label: 'Archived',
        ),
      ],
    ),);
  }
}
