part of '../create_post.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t15,
                  Text(
                    'Create Post',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t60,
              Avatar(
                user: profiles.first,
                type: AvatarType.detailed,
              ),
              Space.y.t30,
              const AppMultilineInputField(
                name: _FormKeys.caption,
                hint: 'Start typing here...',
                maxLines: 10,
              ),
              Space.y.t60,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const _Modal(),
                      );
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      strokeWidth: 2,
                      dashPattern: const [10],
                      color: AppTheme.grey,
                      child: SizedBox(
                        height: 65.un(),
                        width: 50.un(),
                        child: Center(
                          child: CustomPaint(
                            painter: const GalleryIconPainter(),
                            size: GalleryIconPainter.s(
                              15.un(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Space.y.t60,
              AppButton(
                label: 'POST',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
