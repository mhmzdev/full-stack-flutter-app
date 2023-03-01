part of '../home.dart';

class _CapsuleSwitch extends StatelessWidget {
  const _CapsuleSwitch();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.un(),
      padding: Space.a.t10,
      decoration: BoxDecoration(
        color: AppTheme.greyDark,
        borderRadius: 12.radius(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AppButton(
              label: 'News Feed',
              onPressed: () {},
            ),
          ),
          Space.x.t15,
          Expanded(
            child: AppButton(
              label: 'Discover',
              onPressed: () {},
              style: AppButtonStyle.ghost,
            ),
          ),
        ],
      ),
    );
  }
}
