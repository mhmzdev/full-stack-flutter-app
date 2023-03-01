part of '../post_card.dart';

class _Header extends StatelessWidget {
  final User user;
  const _Header({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.h.t20,
      child: Row(
        children: [
          Avatar(
            user: user,
            type: AvatarType.detailed,
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
