part of '../avatar.dart';

class _Detailed extends StatelessWidget {
  final User user;
  final bool showBorder;
  const _Detailed({
    required this.user,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => AppRoutes.profile.push(
            context,
            arguments: {
              'profile': user,
            },
          ),
          child: Container(
            height: 20.un(),
            width: 20.un(),
            padding: showBorder ? const EdgeInsets.all(2) : Space.z,
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
              user.username,
              style: AppText.s1 + AppTheme.grey,
            )
          ],
        )
      ],
    );
  }
}
