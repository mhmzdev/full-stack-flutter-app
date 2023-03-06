part of '../login.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [_AuthListener()],
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.h.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Space.y.t100,
              Space.y.t100,
              Column(
                children: [
                  Text(
                    'Welcome Back!',
                    style: AppText.h2,
                  ),
                  Space.y.t10,
                  Text(
                    'Please sign in to your account',
                    style: AppText.b3 + AppTheme.grey,
                  )
                ],
              ),
              Space.y.t100,
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
              Space.y.t20,
              AppInputField(
                name: _FormKeys.password,
                hint: 'Password',
                isPass: true,
                prefixIcon: Padding(
                  padding: Space.a.t20,
                  child: const CustomPaint(
                    painter: LockIconPainter(),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              Space.y.t10,
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => AppRoutes.forgot.push(context),
                  child: Text(
                    'Forgot Password?',
                    style: AppText.b3 + FontWeight.w700,
                  ),
                ),
              ),
              Space.y.t10,
              AppButton(
                state: AppButtonState.elevated,
                label: 'Sign In',
                onPressed: () {
                  final isValid =
                      screenState.formKey.currentState!.saveAndValidate();

                  if (!isValid) return;
                  final form = screenState.formKey.currentState!;
                  final data = form.value;

                  final values = data.map(
                    (key, value) => MapEntry(
                      key,
                      value.toString().trim(),
                    ),
                  );

                  authCubit.login(
                    values[_FormKeys.email]!,
                    values[_FormKeys.password]!,
                  );
                },
              ),
              const DividerOr(),
              const _SocialLogin(),
              Space.y.t100,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppText.b2,
                  ),
                  TextButton(
                    onPressed: () => AppRoutes.register.push(context),
                    child: Text(
                      'Sign Up',
                      style: AppText.b2 + FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
