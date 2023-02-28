part of '../login.dart';

class _SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  const _SocialLoginButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: 12.radius(),
      child: Container(
        padding: Space.v.t20 + Space.h.t30 + Space.h.t25,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.grey,
          ),
          borderRadius: 12.radius(),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
