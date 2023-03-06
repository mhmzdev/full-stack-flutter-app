part of '../avatar.dart';

class _Def extends StatelessWidget {
  final User user;
  const _Def({required this.user});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.un(),
      backgroundColor: AppTheme.primary,
      child: CircleAvatar(
        radius: 24.un(),
        backgroundImage: user.imageURL.isEmpty
            ? const AssetImage(StaticAssets.dp) as ImageProvider
            : NetworkImage(user.imageURL),
      ),
    );
  }
}
