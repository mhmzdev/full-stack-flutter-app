part of '../create_story.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final user = authCubit.state.user!;
    return Screen(
      keyboardHandler: true,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t15,
                  Text(
                    'Create Story',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t60,
              Avatar(
                user: user,
                type: AvatarType.detailed,
              ),
              Space.y.t60,
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const UploadMediaModal(
                        label: 'Create story',
                      ),
                    );
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    strokeWidth: 2,
                    dashPattern: const [10],
                    color: AppTheme.grey,
                    child: SizedBox(
                      height: 150.un(),
                      width: 100.un(),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomPaint(
                              painter: const GalleryIconPainter(),
                              size: GalleryIconPainter.s(
                                25.un(),
                              ),
                            ),
                            Space.y.t20,
                            Text(
                              'Add Photo',
                              style: AppText.b3 + AppTheme.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Space.y.t60,
              AppButton(
                label: 'POST',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
