part of '../login.dart';

class _SocialLogin extends StatelessWidget {
  const _SocialLogin();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialLoginButton(
          icon: const Icon(Icons.apple),
          onTap: () {},
        ),
        Space.x.t25,
        _SocialLoginButton(
          icon: CustomPaint(
            painter: GoogleIconPainter(),
            size: GoogleIconPainter.size(10.un()),
          ),
          onTap: () {},
        ),
        Space.x.t25,
        _SocialLoginButton(
          icon: CustomPaint(
            painter: FacebookIconPainter(
              color: const Color(0xff0165E1),
            ),
            size: FacebookIconPainter.size(10.un()),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
