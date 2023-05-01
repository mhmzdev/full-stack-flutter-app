part of '../profile.dart';

class _Following extends StatelessWidget {
  final List<User> following;
  const _Following({required this.following});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final auth = AuthCubit.c(context);
    final uid = auth.state.user!.id;

    return Container(
      padding: Space.a.t25,
      decoration: AppProps.modalDec,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const AppBackButton(),
                Space.x.t15,
                Text(
                  'Following',
                  style: AppText.b2,
                )
              ],
            ),
            Space.y.t30,
            if (following.isEmpty)
              const Center(
                child: Text(
                  'You are not following anyone yet!',
                ),
              )
            else
              ...following.map(
                (f) => Padding(
                  padding: Space.v.t15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Avatar(
                        user: f,
                        type: AvatarType.detailed,
                      ),
                      TextButton(
                        onPressed: () {
                          ''.pop(context);
                          auth.follow(uid, f.id);
                        },
                        child: Text(
                          'Unfollow',
                          style: AppText.s1 + AppTheme.danger,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Space.bottom,
          ],
        ),
      ),
    );
  }
}
