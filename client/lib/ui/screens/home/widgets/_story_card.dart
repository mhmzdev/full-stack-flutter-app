part of '../home.dart';

class _StoryCard extends StatelessWidget {
  final User user;
  const _StoryCard({required this.user});

  @override
  Widget build(BuildContext context) {
    final auth = AuthCubit.c(context, true);
    final currentUser = auth.state.user!;

    final storyCubit = StoryCubit.c(context, true);
    final stories = storyCubit.state.stories ?? [];
    final userStories =
        stories.where((element) => user.stories.contains(element.id)).toList();

    final isCurrentUser = currentUser.id == userStories.firstOrNull?.uid;

    if (userStories.isEmpty) return const SizedBox.shrink();

    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () async {
        if (isCurrentUser) {
          final viewStory = await showModalBottomSheet<bool?>(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const _StoryModal(),
          );
          if (viewStory == null || !viewStory) return;
        }

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          AppRoutes.storyView.push(
            context,
            arguments: {'stories': userStories},
          );
        });
      },
      child: Container(
        margin: Space.r.t25,
        width: 50.un(),
        height: 65.un(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: 12.radius(),
                child: CachedNetworkImage(
                  imageUrl: userStories.last.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: 12.radius(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  height: 25.un(),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundLight.withValues(alpha: 0.8),
                    border: Border.all(color: AppTheme.grey),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(1.un()),
                      bottom: Radius.circular(5.un()),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.un(),
                  width: 15.un(),
                  child: ClipRRect(
                    borderRadius: 150.radius(),
                    child:
                        user.imageURL.isEmpty
                            ? Image.asset(StaticAssets.dp, fit: BoxFit.cover)
                            : CachedNetworkImage(
                              imageUrl: user.imageURL,
                              fit: BoxFit.cover,
                            ),
                  ),
                ),
                Space.y.t10,
                Text('${user.firstName} ${user.lastName.substring(0, 1)}.'),
                Space.y.t30,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
