part of '../profile.dart';

class _Followers extends StatelessWidget {
  final List<User> followers;
  const _Followers({required this.followers});

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
                  'Followers',
                  style: AppText.b2,
                )
              ],
            ),
            Space.y.t30,
            if (followers.isEmpty)
              const Center(
                child: Text(
                  'No Followers Yet!',
                ),
              )
            else
              ...followers.map(
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
                          auth.follow(uid, f.id, true);
                        },
                        child: Text(
                          'Remove',
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
