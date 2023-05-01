part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final postCubit = PostCubit.c(context, true);
    final authCubit = AuthCubit.c(context, true);
    final user = authCubit.state.user!;
    final users = authCubit.state.users!;

    final profile = users.firstWhereOrNull(
            (element) => element.id == screenState.profile?.id) ??
        user;
    final isCurrentUser = user.id == profile.id;

    return Screen(
      keyboardHandler: true,
      bottomBar: true,
      overlayBuilders: const [_AuthListener(), _FollowListener()],
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _Header(
              profile: profile,
              isCurrentUser: isCurrentUser,
            ),
            Padding(
              padding: Space.h.t25,
              child: Column(
                children: [
                  Space.y.t25,
                  Text(
                    '${profile.firstName} ${profile.lastName}',
                    style: AppText.h3,
                  ),
                  Space.y.t10,
                  Text(
                    "\"${profile.bio}\"",
                    style: AppText.s1 + AppTheme.grey,
                    textAlign: TextAlign.center,
                  ),
                  Space.y.t20,
                  if (profile.birthday != null) ...[
                    Text(
                      "Birthday: ${DateFormat('dd MMM, yyyy').format(profile.birthday!)}",
                      style: AppText.s1 + AppTheme.grey,
                    ),
                    Space.y.t30,
                  ],
                  if (!isCurrentUser) ...[
                    Space.y.t20,
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            style: profile.followers.contains(user.id)
                                ? AppButtonStyle.danger
                                : AppButtonStyle.blue,
                            height: 18.un(),
                            label: profile.followers.contains(user.id)
                                ? 'Unfollow'
                                : 'Follow',
                            onPressed: () =>
                                authCubit.follow(user.id, profile.id),
                          ),
                        ),
                        Space.x.t15,
                        Expanded(
                          child: AppButton(
                            style: AppButtonStyle.dark,
                            height: 18.un(),
                            label: 'Message',
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Space.y.t20,
                  ],
                  _Stats(
                    profile: profile,
                  ),
                  Space.y.t30,
                  const _ContentCapsule(),
                  Space.y.t25,
                  if (profile.posts.isEmpty && isCurrentUser)
                    const Empty(
                      result: EmptyResult.emptyContent,
                    )
                  else
                    GridView.builder(
                      padding: Space.z,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: profile.posts.length,
                      itemBuilder: (context, index) {
                        final id = profile.posts.reversed.toList()[index];
                        final filterImages =
                            screenState.contentType == ContentType.images;

                        final post =
                            postCubit.state.posts!.firstWhere((element) {
                          bool hasImageType = false;
                          final matchId = element.id == id;
                          if (filterImages) {
                            hasImageType = element.hasImage != null;
                          } else {
                            hasImageType = element.hasVideo != null;
                          }

                          return matchId && hasImageType;
                        });

                        if (!filterImages) {
                          return const SizedBox.shrink();
                        }

                        return GestureDetector(
                          onTap: () => AppRoutes.postView.push(
                            context,
                            arguments: {'post': post},
                          ),
                          child: Container(
                            margin: Space.a.t10,
                            child: ClipRRect(
                              borderRadius: 12.radius(),
                              child: CachedNetworkImage(
                                imageUrl: post.imageUrl,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, progress) {
                                  return Center(
                                    child: Text(
                                      'Loading...',
                                      style: AppText.b2 + AppTheme.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            Space.y.t100,
            Space.y.t100,
            Space.bottom,
          ],
        ),
      ),
    );
  }
}
