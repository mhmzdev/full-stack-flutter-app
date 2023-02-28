part of '../welcome.dart';

class _Card extends StatelessWidget {
  final User user;
  const _Card({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.un(),
      padding: Space.a.t10 + Space.v.t25,
      decoration: BoxDecoration(
        color: AppTheme.greyDark,
        borderRadius: 20.radius(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 12.un(),
            backgroundImage: AssetImage(
              user.imageURL,
            ),
          ),
          Space.y.t15,
          Text(
            user.firstName,
            style: AppText.s1 + AppTheme.grey,
          )
        ],
      ),
    );
  }
}
