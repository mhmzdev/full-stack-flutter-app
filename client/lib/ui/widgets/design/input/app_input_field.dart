import 'package:client/configs/configs.dart';
import 'package:client/ui/painter/icons/eye.dart';
import 'package:client/ui/painter/icons/eye_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppInputField extends StatefulWidget {
  final String name;
  final String? hint;
  final String? label;

  final bool? enabled;
  final FocusNode? node;

  final bool isPass;

  final Widget? prefixIcon;
  final String? initialValue;

  final bool readOnly;

  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  final String? errorText;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  final String Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppInputField({
    Key? key,
    required this.name,
    this.node,
    this.hint,
    this.label,
    this.enabled,
    this.validator,
    this.onChanged,
    this.errorText,
    this.prefixIcon,
    this.initialValue,
    this.textInputType,
    this.isPass = false,
    this.inputFormatters,
    this.readOnly = false,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  AppInputFieldState createState() => AppInputFieldState();
}

class AppInputFieldState extends State<AppInputField> {
  bool showPass = true;
  void _showPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: AppText.b2,
            ),
            Space.y.t15,
          ],
          FormBuilderTextField(
            name: widget.name,
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
            enabled: widget.enabled ?? true,
            initialValue: widget.initialValue,
            autofocus: false,
            obscureText: widget.isPass ? showPass : false,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            focusNode: widget.node,
            cursorColor: AppTheme.primary,
            inputFormatters: widget.inputFormatters,
            style: AppText.b2,
            decoration: InputDecoration(
              errorText: widget.errorText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPass
                  ? IconButton(
                      onPressed: _showPass,
                      icon: showPass
                          ? CustomPaint(
                              painter: const EyeCloseIconPainter(
                                color: AppTheme.grey,
                              ),
                              size: EyeCloseIconPainter.s(10.un()),
                            )
                          : CustomPaint(
                              painter: const EyeIconPainter(
                                color: AppTheme.grey,
                              ),
                              size: EyeIconPainter.s(10.un()),
                            ),
                    )
                  : null,
              filled: true,
              fillColor: AppTheme.backgroundLight,
              hintText: widget.hint,
              hintStyle: AppText.b3.copyWith(
                color: AppTheme.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: AppTheme.primary,
                  width: 1.un(),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(200),
                  width: 1.un(),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(200),
                  width: 1.un(),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  width: 1.un(),
                  color: Colors.transparent,
                ),
              ),
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
