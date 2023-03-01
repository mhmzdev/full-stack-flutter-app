part of '../inbox.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      padding: Space.a.t25,
      initialFormValue: _FormData.initialValues(),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _Header(),
            Space.y.t30,
            Expanded(
              child: ListView.separated(
                controller: screenState.controller,
                separatorBuilder: (context, index) => Space.y.t20,
                itemCount: screenState.chats.length,
                itemBuilder: (context, index) {
                  return screenState.chats[index];
                },
              ),
            ),
            Space.y.t30,
            Row(
              children: [
                const Expanded(
                  child: _MessageInput(),
                ),
                Space.x.t15,
                AppIconButton(
                  color: (screenState.message != null &&
                          screenState.message!.isNotEmpty)
                      ? AppTheme.primary
                      : null,
                  icon: CustomPaint(
                    painter: const SendIconPainter(),
                    size: SendIconPainter.s(10.un()),
                  ),
                  onTap: () {
                    if (screenState.message == null ||
                        screenState.message!.isEmpty) {
                      return;
                    }

                    screenState.onSubmit();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
