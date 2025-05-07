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
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.backgroundLight.withValues(alpha: 0.8),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5.un()),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      actions(context, post).map((e) {
                        return GestureDetector(
                          onTap: e.onTap,
                          child: Padding(padding: Space.r.t20, child: e.icon),
                        );
                      }).toList(),
                ),
                Space.y.t10,
                Row(
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
                    ),
                  ],
                ),
                Space.y.t10,
                if (post.caption.isNotEmpty) ...[
                  if (post.caption.length > 20)
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${post.caption.substring(0, 20)}...',
                            style: AppText.s1 + Colors.white,
                          ),
                          TextSpan(
                            text: ' more',
                            style: AppText.s1 + FontWeight.w800,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap =
                                      () => AppRoutes.postView.push(
                                        context,
                                        arguments: {'post': post},
                                      ),
                          ),
                        ],
                      ),
                    )
                  else
                    Text(post.caption, style: AppText.s1),
                  Space.y.t10,
                ],
                Text(
                  timeago.format(post.createdAt),
                  style: AppText.s1 + AppTheme.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
