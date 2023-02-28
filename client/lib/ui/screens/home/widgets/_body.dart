part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      bottomBar: true,
      keyboardHandler: true,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Header(),
              Space.y.t25,
              Text(
                'Stories',
                style: AppText.b2,
              ),
              Space.y.t20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: profiles.map((e) => _StoryCard(user: e)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
