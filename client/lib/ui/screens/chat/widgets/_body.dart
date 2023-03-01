part of '../chat.dart';

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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Text(
                    'Conversations',
                    style: AppText.h3,
                  ),
                  AppIconButton(
                    icon: CustomPaint(
                      painter: const AddIconPainter(),
                      size: AddIconPainter.s(12.un()),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Space.y.t30,
              AppInputField(
                name: _FormKeys.search,
                prefixIcon: Padding(
                  padding: Space.a.t20,
                  child: const CustomPaint(
                    painter: SearchIconPainter(),
                  ),
                ),
                hint: 'Search here...',
              ),
              Space.y.t60,
              Text(
                'Messages',
                style: AppText.b2 + FontWeight.w500,
              ),
              Space.y.t20,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profiles.length,
                separatorBuilder: (context, index) => Space.y.t20,
                itemBuilder: (context, index) {
                  final user = profiles[index];

                  return _Tile(user: user);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
