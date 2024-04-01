part of '../empty_results.dart';

class _EmptyContent extends StatelessWidget {
  const _EmptyContent();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      children: [
        Text(
          'No Posts Uploaded Yet!',
          style: AppText.h3,
        ),
        Space.y.t10,
        Text(
          "Let's upload something nice get started!",
          style: AppText.b3 + AppTheme.grey,
          textAlign: TextAlign.center,
        ),
        Space.y.t20,
        Image.asset(
          StaticAssets.arrowWhirlDown,
          height: 200,
        ),
      ],
    );
  }
}
