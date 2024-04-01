part of '../home.dart';

class _FeedCapsule extends StatelessWidget {
  const _FeedCapsule();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.un(),
      padding: Space.a.t10,
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: 12.radius(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AppButton(
              size: AppButtonSize.small,
              label: 'News Feed',
              onPressed: () {},
            ),
          ),
          Space.x.t15,
          Expanded(
            child: AppButton(
              label: 'Discover',
              size: AppButtonSize.small,
              onPressed: () {},
              style: AppButtonStyle.ghost,
            ),
          ),
        ],
      ),
    );
  }
}
