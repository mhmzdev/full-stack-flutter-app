part of '../profile.dart';

class _ContentCapsule extends StatelessWidget {
  const _ContentCapsule();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Container(
      height: 23.un(),
      padding: Space.a.t10,
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        borderRadius: 12.radius(),
      ),
      child: Row(
        children: ContentType.values
            .map(
              (type) => Expanded(
                child: AppButton(
                  size: AppButtonSize.small,
                  style: state.contentType == type
                      ? AppButtonStyle.blue
                      : AppButtonStyle.ghost,
                  label: type.name.sentenceCase,
                  onPressed: () {
                    state.setType(type);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
