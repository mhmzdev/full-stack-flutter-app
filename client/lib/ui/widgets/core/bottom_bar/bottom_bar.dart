import 'dart:ui';

import 'package:client/configs/configs.dart';
import 'package:client/services/alice.dart';
import 'package:client/ui/painter/base.dart';
import 'package:flutter/material.dart';

part '_data.dart';
part '_model.dart';

part 'widgets/_bottom_bar_icon.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final currentPath = ModalRoute.of(context)!.settings.name;

    return GestureDetector(
      onDoubleTap: () => AppAlice.showInspector(),
      child: SizedBox(
        height: 120,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    padding: Space.a.t15 + Space.t.t15,
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundDark.withValues(alpha: .9),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5.un()),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                              _items.asMap().entries.map((e) {
                                final isSelected = currentPath == e.value.path;

                                if (e.key == 1) {
                                  return Space.x.t100;
                                }

                                return Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (!isSelected) {
                                        final path = e.value.path;
                                        Navigator.pushReplacementNamed(
                                          context,
                                          path,
                                        );
                                      }
                                    },
                                    child: _BottomBarIcon(
                                      item: e.value,
                                      isSelected: isSelected,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        Space.y.t25,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(360),
              onTap:
                  () => AppRoutes.createPost.push(
                    context,
                    arguments: {'source': currentPath},
                  ),
              child: Container(
                height: 30.un(),
                width: 30.un(),
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(child: _items[1].active),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
