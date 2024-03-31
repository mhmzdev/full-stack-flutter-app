part of '../bottom_bar.dart';

class _BottomBarIcon extends StatelessWidget {
  final _ItemModel item;
  final bool isSelected;
  const _BottomBarIcon({
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected ? item.active : item.inActive,
        Space.y.t10,
        Text(
          item.label,
          style: AppText.s1 + (isSelected ? AppTheme.primary : AppTheme.grey),
        )
      ],
    );
  }
}
