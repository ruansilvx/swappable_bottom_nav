import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: items[currentIndex].backgroundColor,
          borderRadius: BorderRadius.circular(80),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: kBottomNavigationBarHeight,
        duration: Durations.medium4,
        clipBehavior: Clip.antiAlias,
        child: Material(
          type: MaterialType.transparency,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(80),
                    onTap: () => onTap(i),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScale(
                          scale: currentIndex == i ? .8 : 1,
                          duration: Durations.short3,
                          child: items[i].icon,
                        ),
                        if (currentIndex == i) Text(items[i].label ?? ''),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
