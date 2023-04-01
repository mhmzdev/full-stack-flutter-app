part of '../post_view.dart';

class _Header extends StatelessWidget {
  final User user;
  final Post post;
  final bool isOwner;
  const _Header({
    required this.user,
    required this.post,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.h.t25,
      child: Row(
        children: [
          const AppBackButton(),
          Space.x.t20,
          Expanded(
            child: PostHeader(
              user: user,
              post: post,
              hasPadding: false,
            ),
          ),
        ],
      ),
    );
  }
}
