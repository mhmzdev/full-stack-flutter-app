part of '../edit_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(profiles.first),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t15,
                  Text(
                    'Edit profile',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t30,
              Stack(
                alignment: Alignment.center,
                children: [
                  Avatar(
                    user: profiles.first,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: AppIconButton(
                      color: AppTheme.primary,
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Space.y.t60,
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const UploadMediaModal(),
                  );
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  strokeWidth: 2,
                  dashPattern: const [10],
                  color: AppTheme.grey,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Space.y.t60,
                        CustomPaint(
                          painter: const GalleryIconPainter(),
                          size: GalleryIconPainter.s(
                            15.un(),
                          ),
                        ),
                        Space.y.t20,
                        Text(
                          'Upload cover photo',
                          style: AppText.b3 + AppTheme.grey,
                        ),
                        Space.y.t60,
                      ],
                    ),
                  ),
                ),
              ),
              Space.y.t60,
              const AppMultilineInputField(
                name: _FormKeys.bio,
                label: 'Bio',
              ),
              Space.y.t20,
              Row(
                children: [
                  Expanded(
                    child: AppInputField(
                      name: _FormKeys.firstName,
                      hint: 'First name',
                      prefixIcon: Padding(
                        padding: Space.a.t20,
                        child: const CustomPaint(
                          painter: PersonOutlineIconPainter(),
                        ),
                      ),
                    ),
                  ),
                  Space.x.t20,
                  Expanded(
                    child: AppInputField(
                      name: _FormKeys.lastName,
                      hint: 'Last name',
                      prefixIcon: Padding(
                        padding: Space.a.t20,
                        child: const CustomPaint(
                          painter: PersonOutlineIconPainter(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Space.y.t20,
              AppInputField(
                name: _FormKeys.username,
                hint: 'username',
                prefixIcon: Padding(
                  padding: Space.a.t20,
                  child: const CustomPaint(
                    painter: PersonBrokenIconPainter(),
                  ),
                ),
              ),
              Space.y.t20,
              AppDateTimeInput(
                name: _FormKeys.dob,
                hint: 'Date of birth',
                firstDate: DateTime(1950, 1, 1),
                lastDate: DateTime.now(),
              ),
              Space.y.t30,
              AppButton(
                label: 'Update',
                onPressed: () {},
              ),
              Space.y.t30,
              Space.bottom,
            ],
          ),
        ),
      ),
    );
  }
}
