import 'package:flutter/material.dart';
import 'package:swappable_bottom_nav/tab_swap_provider.dart';

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
    highlightedBorderRadius(index) => BorderRadius.only(
          topLeft: index == 0 ? const Radius.circular(80) : Radius.zero,
          bottomLeft: index == 0 ? const Radius.circular(80) : Radius.zero,
          topRight: index == items.length - 1
              ? const Radius.circular(80)
              : Radius.zero,
          bottomRight: index == items.length - 1
              ? const Radius.circular(80)
              : Radius.zero,
        );

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
                  child: LongPressDraggable(
                    data: i,
                    onDragStarted: () {
                      onTap(i);
                    },
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    feedback: SizedBox(
                      width: (MediaQuery.sizeOf(context).width - 40) /
                          items.length,
                      height: kBottomNavigationBarHeight,
                      child: Material(
                        borderRadius: BorderRadius.circular(80),
                        color: items[i].backgroundColor,
                        child: _BottomNavItem(
                          onTap: () => onTap(i),
                          isSelected: true,
                          item: items[i],
                        ),
                      ),
                    ),
                    childWhenDragging: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: highlightedBorderRadius(i),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                    child: DragTarget<int>(
                      onAcceptWithDetails: (details) async {
                        context.tabController.swapTabs(i, details.data);
                        onTap(i);
                      },
                      builder: (context, candidateItems, rejectedItems) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: candidateItems.isNotEmpty
                                ? highlightedBorderRadius(i)
                                : null,
                            border: candidateItems.isNotEmpty
                                ? Border.all(
                                    color: items[i].backgroundColor!,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: _BottomNavItem(
                            onTap: () => onTap(i),
                            isSelected: currentIndex == i,
                            item: items[i],
                          ),
                        );
                      },
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

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.onTap,
    required this.isSelected,
    required this.item,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(80),
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: isSelected ? .8 : 1,
            duration: Durations.short3,
            child: item.icon,
          ),
          if (isSelected) Text(item.label ?? ''),
        ],
      ),
    );
  }
}
