part of '../profile.dart';

class _ContentCapsule extends StatelessWidget {
  const _ContentCapsule();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Container(
      height: 23.un(),
      padding: Space.a.t10,
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: 12.radius(),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              style: state.contentType == ContentType.posts
                  ? AppButtonStyle.blue
                  : AppButtonStyle.ghost,
              label: 'Posts',
              onPressed: () {
                state.setType(ContentType.posts);
              },
            ),
          ),
          Space.x.t20,
          Expanded(
            child: AppButton(
              style: state.contentType == ContentType.videos
                  ? AppButtonStyle.blue
                  : AppButtonStyle.ghost,
              label: 'Videos',
              onPressed: () {
                state.setType(ContentType.videos);
              },
            ),
          )
        ],
      ),
    );
  }
}
