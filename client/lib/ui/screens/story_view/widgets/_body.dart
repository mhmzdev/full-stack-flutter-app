part of '../story_view.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _ScreenState.s(context).startTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    final story = state.stories[state.current];

    final storyCubit = StoryCubit.c(context);
    final auth = AuthCubit.c(context, true);
    final isOwner = auth.state.user!.id == story.uid;

    return Screen(
      onBackPressed: () async {
        state.cancelTimer();
        ''.pop(context);

        return true;
      },
      keyboardHandler: true,
      overlayBuilders: const [_DeleteListener()],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: story.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            state.prev(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            state.next(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 5.un(),
                  right: 5.un(),
                  top: 25.un(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: state.stories.asMap().entries.map(
                          (s) {
                            return Expanded(
                              child: Padding(
                                padding: Space.h.t05,
                                child: LinearProgressIndicator(
                                  minHeight: 2.un(),
                                  value: state.current > s.key
                                      ? 1
                                      : (state.duration / 100000) * 7.5,
                                  backgroundColor: AppTheme.greyDark,
                                  color: s.key <= state.current
                                      ? Colors.white
                                      : AppTheme.greyDark,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      Space.y.t30,
                      _Header(
                        story: story,
                      ),
                    ],
                  ),
                ),
                if (isOwner)
                  Positioned(
                    bottom: 20.un(),
                    right: 10.un(),
                    child: AppIconButton(
                      color: AppTheme.danger,
                      icon: const Icon(Icons.delete),
                      onTap: () => storyCubit.deleteStory(
                        story.id,
                        story.imageUrl,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
