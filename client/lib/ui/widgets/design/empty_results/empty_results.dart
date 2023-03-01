import 'package:client/configs/configs.dart';
import 'package:client/utils/assets.dart';
import 'package:flutter/material.dart';

part 'variants/_empty_news_feed.dart';

enum EmptyResult {
  emptyFeed,
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

    return const SizedBox.shrink();
  }
}
