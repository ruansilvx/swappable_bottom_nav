import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swappable_bottom_nav/custom_bottom_navigation_bar.dart';
import 'package:swappable_bottom_nav/tab_swap_provider.dart';

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
      bottomNavigationBar: ListenableBuilder(
        listenable: context.tabController,
        builder: (context, _) {
          return CustomBottomNavigationBar(
            currentIndex: statefulNavigationShell.currentIndex,
            onTap: (index) {
              statefulNavigationShell.goBranch(index);
            },
            items: context.tabController.currentTabConfiguration
                .map((item) => item.builder(context))
                .toList(),
          );
        },
      ),
    );
  }
}
