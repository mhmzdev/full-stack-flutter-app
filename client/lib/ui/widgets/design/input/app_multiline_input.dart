import 'package:client/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppMultilineInputField extends StatelessWidget {
  final String name;
  final String? hint;
  final String? label;
  final int maxLines;
  final bool autoFocus;

  final bool? enabled;
  final FocusNode? node;

  final bool isPass;

  final Widget? prefixIcon;
  final String? initialValue;

  final bool readOnly;

  final TextInputType? textInputType;

  final String? errorText;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppMultilineInputField({
    super.key,
    required this.name,
    this.maxLines = 5,
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
    this.autoFocus = false,
    this.inputFormatters,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: AppText.b2,
            ),
            Space.y.t15,
          ],
          FormBuilderTextField(
            name: name,
            readOnly: readOnly,
            textCapitalization: textCapitalization,
            enabled: enabled ?? true,
            initialValue: initialValue,
            autofocus: autoFocus,
            maxLines: maxLines,
            textInputAction: TextInputAction.newline,
            keyboardType: textInputType,
            focusNode: node,
            cursorColor: AppTheme.primary,
            inputFormatters: inputFormatters,
            style: AppText.b2,
            decoration: InputDecoration(
              errorText: errorText,
              filled: true,
              fillColor: AppTheme.backgroundLight,
              hintText: hint,
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
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
