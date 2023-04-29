part of '../home.dart';

class _Stories extends StatelessWidget {
  const _Stories();

  @override
  Widget build(BuildContext context) {
    final auth = AuthCubit.c(context, true);
    final current = auth.state.user!;
    final profiles =
        auth.state.users!.where((u) => u.id != current.id).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocConsumer<StoryCubit, StoryState>(
        listenWhen: StoryFetchAllState.match,
        listener: (context, state) {
          if (state.fetchAll is StoryFetchAllFailed) {
            final msg = state.fetchAll.message!.split(": ").last;
            SnackBars.failure(context, msg);
          }
        },
        builder: (context, state) {
          if (state.fetchAll is StoryFetchAllLoading) {
            return Row(
              children: List.generate(
                3,
                (index) => Container(
                  margin: Space.r.t20,
                  width: 50.un(),
                  height: 65.un(),
                  decoration: BoxDecoration(
                    borderRadius: 12.radius(),
                    color: AppTheme.greyDark,
                  ),
                ),
              ),
            );
          } else if (state.fetchAll is StoryFetchAllSuccess) {
            return Row(
              children: [
                const _CreateStory(),
                if (profiles.isNotEmpty) ...[
                  Space.x.t25,
                  ...profiles.map((e) => _StoryCard(user: e)),
                ],
              ],
            );
          } else if (state.fetchAll is StoryFetchAllFailed) {
            return Text(
              'Failed to get stories, try again!',
              style: AppText.b2 + AppTheme.danger,
            );
          }

          return Text(
            'Something went wrong!',
            style: AppText.b2 + AppTheme.danger,
          );
        },
      ),
    );
  }
}
