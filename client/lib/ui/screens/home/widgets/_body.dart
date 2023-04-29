part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      bottomBar: true,
      overlayBuilders: const [_DeleteListener()],
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Header(),
              Space.y.t25,
              Text(
                'Stories',
                style: AppText.b2,
              ),
              Space.y.t20,
              const _Stories(),
              Space.y.t30,
              const _FeedCapsule(),
              Space.y.t30,
              BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state.fetchAll is PostFetchAllLoading) {
                    return const LinearProgressIndicator();
                  } else if (state.fetchAll is PostFetchAllSuccess) {
                    if (state.posts == null || state.posts!.isEmpty) {
                      return const Empty(
                        result: EmptyResult.emptyFeed,
                      );
                    }

                    state.posts!
                        .sort((a, b) => b.createdAt.compareTo(a.createdAt));

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Space.y.t30,
                      itemCount: state.posts!.length,
                      itemBuilder: (context, index) {
                        final post = state.posts![index];
                        return PostCard(post: post);
                      },
                    );
                  }

                  return Center(
                    child: Text(
                      'Something went wrong!',
                      style: AppText.b1 + AppTheme.danger,
                    ),
                  );
                },
              ),
              Space.y.t100,
              Space.y.t100,
            ],
          ),
        ),
      ),
    );
  }
}
