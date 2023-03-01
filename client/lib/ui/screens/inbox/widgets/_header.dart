part of '../inbox.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Row(
      children: [
        const AppBackButton(),
        Space.x.t20,
        Avatar(
          user: screenState.user,
          type: AvatarType.detailed,
        ),
        Space.xm,
        AppIconButton(
          icon: CustomPaint(
            painter: const PhoneIconPainter(),
            size: PhoneIconPainter.s(10.un()),
          ),
          onTap: () {},
        ),
        Space.x.t20,
        AppIconButton(
          icon: CustomPaint(
            painter: const VideoIconPainter(),
            size: VideoIconPainter.s(10.un()),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
