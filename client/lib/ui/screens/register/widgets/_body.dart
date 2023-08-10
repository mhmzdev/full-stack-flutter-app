part of '../register.dart';

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
      overlayBuilders: const [_Listener()],
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.h.t25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Space.y.t20,
              const Row(
                children: [
                  AppBackButton(),
                ],
              ),
              Space.y.t60,
              Column(
                children: [
                  Text(
                    'Create Account',
                    style: AppText.h3,
                  ),
                  Space.y.t10,
                  Text(
                    'Please fill the form below',
                    style: AppText.b3 + AppTheme.grey,
                  )
                ],
              ),
              Space.y.t100,
              Row(
                children: [
                  Expanded(
                    child: AppInputField(
                      name: _FormKeys.firstName,
                      textCapitalization: TextCapitalization.sentences,
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
                      textCapitalization: TextCapitalization.sentences,
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
              Space.y.t100,
              Space.y.t100,
              AppButton(
                label: 'Sign Up',
                onPressed: () {
                  final isValid =
                      screenState.formKey.currentState!.saveAndValidate();

                  if (!isValid) return;

                  final form = screenState.formKey.currentState!;
                  final data = form.value;

                  final values = data.map(
                    (key, value) => MapEntry(key, value.toString().trim()),
                  );

                  authCubit.register(
                    values[_FormKeys.firstName]!,
                    values[_FormKeys.lastName]!,
                    values[_FormKeys.username]!,
                    values[_FormKeys.email]!,
                    values[_FormKeys.password]!,
                  );
                },
              ),
              Space.y.t20,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
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
      ),
    );
  }
}
