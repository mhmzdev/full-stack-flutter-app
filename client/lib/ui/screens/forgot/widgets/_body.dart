part of '../forgot.dart';

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
        child: ScrollColumnExpandable(
          padding: Space.h.t25,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Space.y.t20,
            const Row(
              children: [
                AppBackButton(),
              ],
            ),
            Space.y.t60,
            Text(
              "Forgot Password?",
              style: AppText.h3,
            ),
            Space.y.t10,
            Text(
              "Reset link will be sent to your email address.",
              style: AppText.b2,
            ),
            Image.asset(
              StaticAssets.forgotPassword,
            ),
            AppInputField(
              name: _FormKeys.email,
              hint: 'Email address',
              prefixIcon: Padding(
                padding: Space.a.t20,
                child: const CustomPaint(
                  painter: EmailIconPainter(),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
              ]),
            ),
            Space.y.t30,
            AppButton(
              state: AppButtonState.elevated,
              label: 'Reset Password',
              onPressed: () {},
            ),
            Space.y.t60,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Remember password?",
                  style: AppText.b2,
                ),
                TextButton(
                  onPressed: () => ''.pop(context),
                  child: Text(
                    'Log in',
                    style: AppText.b2 + FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
