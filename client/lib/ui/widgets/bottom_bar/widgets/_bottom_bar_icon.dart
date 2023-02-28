part of '../bottom_bar.dart';

class _BottomBarIcon extends StatelessWidget {
  final _ItemModel item;
  final bool isSelected;
  const _BottomBarIcon({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected ? item.active : item.inActive,
        Space.yf(0.2),
        Text(
          item.label,
          style: AppText.s1 + (isSelected ? AppTheme.primary : AppTheme.grey),
        )
      ],
    );
  }
}
