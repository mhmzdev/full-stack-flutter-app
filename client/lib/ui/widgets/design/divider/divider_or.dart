import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.v.t30 + Space.v.t15,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppTheme.grey,
            ),
          ),
          Space.x.t10,
          Text(
            'OR',
            style: AppText.b3 + AppTheme.grey,
          ),
          Space.x.t10,
          const Expanded(
            child: Divider(
              color: AppTheme.grey,
            ),
          ),
        ],
      ),
    );
  }
}
