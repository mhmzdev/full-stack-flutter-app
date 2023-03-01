part of '../home.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Flutteram',
          style: AppText.h3,
        ),
        Space.xm,
        AppIconButton(
          icon: CustomPaint(
            painter: const NotificationIconPainter(),
            size: NotificationIconPainter.s(10.un()),
          ),
          onTap: () {},
        ),
        Space.x.t20,
        AppIconButton(
          icon: CustomPaint(
            painter: const ChatIconPainter(),
            size: ChatIconPainter.s(10.un()),
          ),
          onTap: () => AppRoutes.chat.push(context),
        ),
      ],
    );
  }
}
