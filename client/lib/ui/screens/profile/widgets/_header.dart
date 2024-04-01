part of '../profile.dart';

class _Header extends StatelessWidget {
  final User profile;
  final bool isCurrentUser;
  const _Header({
    required this.profile,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context, true);

    return SizedBox(
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
                    icon: const Icon(Iconsax.logout_1),
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
    );
  }
}
