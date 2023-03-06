import 'package:client/configs/configs.dart';
import 'package:client/ui/painter/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class AppDateTimeInput extends StatelessWidget {
  final String name;
  final String? hint;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;

  const AppDateTimeInput({
    Key? key,
    this.hint,
    this.initialDate,
    required this.name,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return FormBuilderDateTimePicker(
      name: name,
      format: DateFormat('dd/MM/yyyy'),
      lastDate: lastDate,
      firstDate: firstDate,
      inputType: InputType.date,
      initialDate: initialDate ?? DateTime(1998, 1, 1),
      style: AppText.b2,
      decoration: InputDecoration(
        errorStyle: AppText.s1 + AppTheme.danger,
        filled: true,
        fillColor: AppTheme.backgroundLight,
        hintText: hint,
        prefixIcon: Padding(
          padding: Space.a.t20,
          child: const CustomPaint(
            painter: CalendarIconPainter(),
          ),
        ),
        hintStyle: AppText.b2 + AppTheme.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            width: 1.un(),
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            width: 1.un(),
            color: AppTheme.primary,
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
      ),
      validator: FormBuilderValidators.required(
        errorText: 'Date of Birth is required',
      ),
    );
  }
}
