part of '../post_card.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.h.t20,
      child: Row(
        children: [
          CircleAvatar(
            radius: 11.un(),
            backgroundColor: AppTheme.primary,
            child: CircleAvatar(
              radius: 10.un(),
              backgroundImage: AssetImage(
                profiles.first.imageURL,
              ),
            ),
          ),
          Space.x.t10,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${profiles.first.firstName} ${profiles.first.lastName}',
                style: AppText.b2 + FontWeight.w500,
              ),
              Text(
                profiles.first.username,
                style: AppText.s1 + AppTheme.grey,
              )
            ],
          ),
          Space.xm,
          AppIconButton(
            icon: CustomPaint(
              painter: const MoreIconPainter(),
              size: MoreIconPainter.s(10.un()),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
