part of '../profile.dart';

class _Stats extends StatelessWidget {
  final User profile;
  const _Stats({required this.profile});

  @override
  Widget build(BuildContext context) {
    final auth = AuthCubit.c(context, true);
    final users = auth.state.users!;
    final user = auth.state.user!;

    final following =
        users.where((element) => user.following.contains(element.id)).toList();

    final followers = users
        .where(
          (element) => user.followers.contains(element.id),
        )
        .toList();

    return Container(
      padding: Space.a.t20,
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: 12.radius(),
        border: Border.all(
          color: AppTheme.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                profile.posts.length.toString(),
                style: AppText.b1,
              ),
              Text(
                'Posts',
                style: AppText.b3 + AppTheme.grey,
              )
            ],
          ),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return _Followers(followers: followers);
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  profile.followers.length.toString(),
                  style: AppText.b1,
                ),
                Text(
                  'Followers',
                  style: AppText.b3 + AppTheme.grey,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return _Following(following: following);
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  profile.following.length.toString(),
                  style: AppText.b1,
                ),
                Text(
                  'Following',
                  style: AppText.b3 + AppTheme.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
