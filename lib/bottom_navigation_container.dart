import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationContainer extends StatelessWidget {
  const BottomNavigationContainer({
    super.key,
    required this.statefulNavigationShell,
  });

  final StatefulNavigationShell statefulNavigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulNavigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statefulNavigationShell.currentIndex,
        onTap: (index) {
          statefulNavigationShell.goBranch(index);
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: 'tab1',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: 'tab2',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: 'tab3',
            icon: Icon(Icons.access_time_filled),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: 'tab4',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
