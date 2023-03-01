part of '../chat.dart';

class _Tile extends StatelessWidget {
  final User user;
  const _Tile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => AppRoutes.inbox.push(
        context,
        arguments: {
          'user': user,
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: 12.radius(),
      ),
      tileColor: AppTheme.backgroundLight,
      leading: CircleAvatar(
        radius: 10.un(),
        backgroundImage: AssetImage(
          user.imageURL,
        ),
      ),
      title: Text(
        '${user.firstName} ${user.lastName}',
      ),
      subtitle: Text(
        'It was the last message here...',
        style: AppText.s1 + AppTheme.grey,
      ),
    );
  }
}
