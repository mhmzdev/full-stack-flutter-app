part of '../edit_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final authCubit = AuthCubit.c(context, true);
    final user = authCubit.state.user!;

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(user),
      overlayBuilders: const [
        _Listener(),
        _MediaListener(),
        _DPListener(),
        _CoverListener()
      ],
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t25,
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
            const _ProfilePhoto(),
            Space.y.t60,
            const _CoverPhoto(),
            Space.y.t60,
            const AppMultilineInputField(
              name: _FormKeys.bio,
              label: 'Bio',
              hint: 'Let others know about you. Write something...',
            ),
            Space.y.t30,
            Row(
              children: [
                Expanded(
                  child: AppInputField(
                    label: 'First Name',
                    name: _FormKeys.firstName,
                    hint: 'Enter your first name',
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
                    label: 'Last Name',
                    name: _FormKeys.lastName,
                    hint: 'Enter your last name',
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
            Space.y.t30,
            AppInputField(
              name: _FormKeys.username,
              hint: 'username',
              label: 'Username',
              prefixIcon: Padding(
                padding: Space.a.t20,
                child: const CustomPaint(
                  painter: PersonBrokenIconPainter(),
                ),
              ),
            ),
            Space.y.t30,
            AppDateTimeInput(
              label: 'Birthday',
              name: _FormKeys.birthday,
              hint: 'Date of birth',
              firstDate: DateTime(1950, 1, 1),
              lastDate: DateTime.now(),
            ),
            Space.y.t30,
            AppButton(
              label: 'Update',
              onPressed: () {
                final isValid =
                    screenState.formKey.currentState!.saveAndValidate();
                if (!isValid) return;

                final form = screenState.formKey.currentState!;
                final data = form.value;

                authCubit.update(
                  data[_FormKeys.firstName],
                  data[_FormKeys.lastName],
                  user.username,
                  data[_FormKeys.username],
                  data[_FormKeys.bio],
                  data[_FormKeys.birthday],
                );
              },
            ),
            Space.y.t30,
          ],
        ),
      ),
    );
  }
}
