part of '../empty_results.dart';

class _EmptyNewsFeed extends StatelessWidget {
  const _EmptyNewsFeed();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: Space.l.t100,
          child: Image.asset(
            StaticAssets.arrowWhirlUp,
          ),
        ),
        Image.asset(
          StaticAssets.emptyFeed,
          height: 100.un(),
        ),
        Space.y.t20,
        Text(
          'No News Feed Yet!',
          style: AppText.h3,
        ),
        Space.y.t20,
        Text(
          "Let's explore stuff to follow up, head over\nto Discover section!",
          style: AppText.b3 + AppTheme.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
