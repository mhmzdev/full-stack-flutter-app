part of '../story_view.dart';

class _Header extends StatelessWidget {
  final Story story;
  const _Header({required this.story});

  @override
  Widget build(BuildContext context) {
    final auth = AuthCubit.c(context, true);
    final user = auth.state.user!;

    return Row(
      children: [
        BackButton(
          onPressed: () {
            _ScreenState.s(context).cancelTimer();
            ''.pop(context);
          },
        ),
        Container(
          height: 20.un(),
          width: 20.un(),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(360),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: user.imageURL.isEmpty
                ? Image.asset(
                    StaticAssets.dp,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: user.imageURL,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Space.x.t15,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.firstName} ${user.lastName}',
              style: AppText.b2 + FontWeight.w500,
            ),
            Text(
              timeago.format(story.createdAt),
              style: AppText.s1 + AppTheme.grey,
            )
          ],
        )
      ],
    );
  }
}
