part of '../comment.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String? comment;

  @override
  Widget build(BuildContext context) {
    final postCubit = PostCubit.c(context);
    final screenState = _ScreenState.s(context, true);

    final auth = AuthCubit.c(context, true);
    final user = auth.state.user!;

    final postedUser = auth.state.users!.firstWhere(
      (element) => element.id == screenState.post.uid,
    );

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [_Listener()],
      child: SafeArea(
        child: Padding(
          padding: Space.a.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t20,
                  Text(
                    'Comments',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t30,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Avatar(
                    user: postedUser,
                    size: 20.un(),
                  ),
                  Space.x.t30,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          screenState.post.caption,
                          style: AppText.b3,
                        ),
                        Space.y.t10,
                        Text(
                          timeago.format(screenState.post.createdAt),
                          style: AppText.s2 + AppTheme.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 15.un(),
              ),
              Space.xm,
              AppInputField(
                name: _FormKeys.comment,
                textCapitalization: TextCapitalization.sentences,
                hint: 'Write something here...',
                onChanged: (value) {
                  setState(() {
                    comment = value;
                  });
                },
                suffixIcon: TextButton(
                  onPressed: (comment == null || comment!.isEmpty)
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();

                          postCubit.comment(
                            screenState.post.id,
                            user.id,
                            comment!,
                          );
                        },
                  child: Text(
                    'Post',
                    style: AppText.b2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
