import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swappable_bottom_nav/tab_swap_controller.dart';

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
        items: TabSwapController.of(context)
            .currentTabConfiguration
            .map((item) => item.builder(context))
            .toList(),
      ),
    );
  }
}
