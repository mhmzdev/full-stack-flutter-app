part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final postCubit = PostCubit.c(context, true);
    final authCubit = AuthCubit.c(context, true);
    final user = authCubit.state.user!;

    final profile = screenState.profile ?? user;
    final isCurrentUser = user.id == profile.id;

    return Screen(
      keyboardHandler: true,
      bottomBar: true,
      overlayBuilders: const [_AuthListener()],
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 110.un(),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  if (profile.coverURL.isNotEmpty)
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                          Rect.fromLTRB(
                            0,
                            0,
                            rect.width,
                            rect.height,
                          ),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: SizedBox(
                        height: 110.un(),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: 12.radius(),
                          child: CachedNetworkImage(
                            imageUrl: profile.coverURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if (!isCurrentUser)
                    Positioned(
                      left: 8.un(),
                      top: 30.un(),
                      child: const AppBackButton(),
                    ),
                  if (isCurrentUser)
                    Positioned(
                      top: 30.un(),
                      left: 8.un(),
                      right: 8.un(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppIconButton(
                            color: AppTheme.danger,
                            icon: const Icon(FontAwesomeIcons.powerOff),
                            onTap: () => authCubit.logout(),
                          ),
                          AppIconButton(
                            icon: CustomPaint(
                              painter: const PersonEditIconPainter(),
                              size: PersonEditIconPainter.s(10.un()),
                            ),
                            onTap: () => AppRoutes.editProfile.push(context),
                          ),
                        ],
                      ),
                    ),
                  Space.y.t100,
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Avatar(
                      user: profile,
                    ),
                  ),
                ],
              ),
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
                            height: 18.un(),
                            label: 'Follow',
                            onPressed: () {},
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
                  Container(
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
                        Column(
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
                        Column(
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
                        )
                      ],
                    ),
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
