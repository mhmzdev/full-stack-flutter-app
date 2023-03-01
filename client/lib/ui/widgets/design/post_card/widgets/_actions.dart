part of '../post_card.dart';

class _Actions extends StatelessWidget {
  final Post post;
  const _Actions({required this.post});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: 12.radius(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: Space.a.t20,
            height: 43.5.un(),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.backgroundLight.withOpacity(0.8),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5.un()),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomPaint(
                        painter:
                            const HeartOutlineIconPainter(color: Colors.white),
                        size: HeartOutlineIconPainter.s(12.un()),
                      ),
                      Space.x.t25,
                      CustomPaint(
                        painter: const CommentIconPainter(color: Colors.white),
                        size: CommentIconPainter.s(12.un()),
                      ),
                      Space.x.t25,
                      CustomPaint(
                        painter: const SendIconPainter(color: Colors.white),
                        size: SendIconPainter.s(12.un()),
                      ),
                    ],
                  ),
                ),
                Space.y.t10,
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: AppText.s1,
                          children: [
                            TextSpan(text: post.likes.length.toString()),
                            TextSpan(
                              text: ' Likes',
                              style: AppText.s1 + AppTheme.grey,
                            ),
                          ],
                        ),
                      ),
                      Space.x.t25,
                      RichText(
                        text: TextSpan(
                          style: AppText.s1,
                          children: [
                            TextSpan(text: post.comments.length.toString()),
                            TextSpan(
                              text: ' Comments',
                              style: AppText.s1 + AppTheme.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  '${post.createdAt.hour} hours ago',
                  style: AppText.s1 + AppTheme.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
