import 'package:client/configs/configs.dart';
import 'package:client/utils/assets.dart';
import 'package:flutter/material.dart';

part 'variants/_empty_news_feed.dart';
part 'variants/_empty_content.dart';

enum EmptyResult {
  emptyFeed,
  emptyContent,
}

class Empty extends StatelessWidget {
  final EmptyResult result;
  const Empty({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    if (result == EmptyResult.emptyFeed) {
      return const _EmptyNewsFeed();
    }

    if (result == EmptyResult.emptyContent) {
      return const _EmptyContent();
    }

    return const SizedBox.shrink();
  }
}
