part of '../inbox.dart';

class _ChatBubble extends StatelessWidget {
  final bool isLoggedIn;
  final String message;

  const _ChatBubble({
    required this.isLoggedIn,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final border = isLoggedIn
        ? BorderRadius.only(
            topLeft: 20.radius().topLeft,
            topRight: 20.radius().topRight,
            bottomLeft: 20.radius().bottomRight,
          )
        : BorderRadius.only(
            topLeft: 20.radius().topLeft,
            topRight: 20.radius().topRight,
            bottomRight: 20.radius().bottomRight,
          );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isLoggedIn) Space.xm,
        Container(
          constraints: BoxConstraints(
            maxWidth: 150.un(),
          ),
          padding: Space.a.t20,
          decoration: BoxDecoration(
            color: isLoggedIn ? AppTheme.primary : AppTheme.greyDark,
            borderRadius: border,
          ),
          child: Column(
            crossAxisAlignment:
                isLoggedIn ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: AppText.b2 + Colors.white,
              ),
              Space.y.t15,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('1:22 pm',
                      style: AppText.s1 +
                          (isLoggedIn ? Colors.white : AppTheme.grey)),
                  if (isLoggedIn) ...[
                    Space.x.t05,
                    Icon(
                      Icons.checklist_rounded,
                      size: 8.un(),
                    )
                  ],
                ],
              ),
            ],
          ),
        ),
        if (!isLoggedIn) Space.xm,
      ],
    );
  }
}
