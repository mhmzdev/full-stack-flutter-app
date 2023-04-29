part of '../home.dart';

class _CreateStory extends StatelessWidget {
  const _CreateStory();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context, true);
    final user = authCubit.state.user!;

    return user.stories.isNotEmpty
        ? _StoryCard(user: user)
        : InkWell(
            onTap: () => AppRoutes.createStory.push(context),
            highlightColor: Colors.transparent,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              strokeWidth: 2,
              dashPattern: const [10],
              color: AppTheme.grey,
              child: SizedBox(
                width: 50.un(),
                height: 65.un(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.gallery_add,
                      color: AppTheme.grey,
                    ),
                    Space.y.t20,
                    Text(
                      'Add Story',
                      style: AppText.b3 + AppTheme.grey,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
