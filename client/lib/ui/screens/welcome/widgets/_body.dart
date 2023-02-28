part of '../welcome.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: Space.h.t30,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: profiles
                      .getRange(0, 2)
                      .map(
                        (e) => Padding(
                          padding: Space.v.t20,
                          child: _Card(user: e),
                        ),
                      )
                      .toList(),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...profiles.getRange(2, 4).map(
                          (e) => Padding(
                            padding: Space.v.t20,
                            child: _Card(user: e),
                          ),
                        ),
                    Space.y.t100,
                    Space.y.t100,
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...profiles.getRange(4, 6).map(
                          (e) => Padding(
                            padding: Space.v.t20,
                            child: _Card(user: e),
                          ),
                        ),
                    Space.y.t60,
                  ],
                ),
              ],
            ),
            Text(
              'Find New Friends\nWith Flutteram',
              style: AppText.h2,
              textAlign: TextAlign.center,
            ),
            Space.y.t20,
            Text(
              'Flutteram is a social media app\ndeveloped using flutter and dart_frog',
              style: AppText.b3 + AppTheme.grey,
              textAlign: TextAlign.center,
            ),
            Space.y.t100,
            AppButton(
              label: 'Get Started',
              state: AppButtonState.elevated,
              onPressed: () => AppRoutes.login.pushReplace(context),
            ),
          ],
        ),
      ),
    );
  }
}
