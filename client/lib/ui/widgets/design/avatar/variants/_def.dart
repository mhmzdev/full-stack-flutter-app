part of '../avatar.dart';

class _Def extends StatelessWidget {
  final User user;
  final double? size;
  final bool showBorder;
  const _Def({
    this.showBorder = true,
    required this.user,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size ?? 50.un(),
        width: size ?? 50.un(),
        padding: showBorder ? Space.a.t05 : Space.z,
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
