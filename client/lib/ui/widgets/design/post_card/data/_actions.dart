part of '../post_card.dart';

List<ActionModel> actions(BuildContext context, Post post) => [
      ActionModel(
        icon: CustomPaint(
          painter: const HeartOutlineIconPainter(color: Colors.white),
          size: HeartOutlineIconPainter.s(12.un()),
        ),
        onTap: () {},
      ),
      ActionModel(
        icon: CustomPaint(
          painter: const CommentIconPainter(),
          size: CommentIconPainter.s(12.un()),
        ),
        onTap: () {},
      ),
      ActionModel(
        icon: CustomPaint(
          painter: const SendIconPainter(),
          size: SendIconPainter.s(12.un()),
        ),
        onTap: () {},
      ),
    ];
