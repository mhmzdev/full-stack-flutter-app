import 'package:flutter/material.dart';

class FocusHandler extends StatelessWidget {
  static void tap(BuildContext context, [VoidCallback? call]) {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    if (call != null) {
      call();
    }
  }

  const FocusHandler({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => tap(context),
      child: child,
    );
  }
}
