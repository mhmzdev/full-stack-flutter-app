part of '../avatar.dart';

class _Def extends StatelessWidget {
  final User user;
  const _Def({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.un(),
        width: 50.un(),
        padding: Space.a.t05,
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
    );
  }
}
