part of '../post_card.dart';

List<_ActionModel> _actions(BuildContext context) => [
      _ActionModel(
        icon: CustomPaint(
          painter: const HeartOutlineIconPainter(color: Colors.white),
          size: HeartOutlineIconPainter.s(12.un()),
        ),
        onTap: () {},
      ),
      _ActionModel(
        icon: CustomPaint(
          painter: const CommentIconPainter(),
          size: CommentIconPainter.s(12.un()),
        ),
        onTap: () {},
      ),
      _ActionModel(
        icon: CustomPaint(
          painter: const SendIconPainter(),
          size: SendIconPainter.s(12.un()),
        ),
        onTap: () {},
      ),
    ];
