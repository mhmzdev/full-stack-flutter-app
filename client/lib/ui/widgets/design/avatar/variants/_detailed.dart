part of '../avatar.dart';

class _Detailed extends StatelessWidget {
  final User user;
  const _Detailed({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.un(),
          backgroundColor: AppTheme.primary,
          child: CircleAvatar(
            radius: 10.un(),
            backgroundImage: AssetImage(
              user.imageURL,
            ),
          ),
        ),
        Space.x.t10,
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
