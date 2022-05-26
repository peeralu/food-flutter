import 'package:flutter/services.dart';
import 'package:food/app/core/theme/theme.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({
    required this.name,
    this.initialValue,
    this.placeholder,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
  });

  final String name;
  final String? initialValue;
  final String? placeholder;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: placeholder,
        filled: true,
        fillColor: AppColors.lightGray.withOpacity(0.35),
        contentPadding: EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceM),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
          borderRadius: AppBorderRadius.xl,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow),
          borderRadius: AppBorderRadius.xl,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: AppBorderRadius.xl,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: AppBorderRadius.xl,
        ),
      ),
    );
  }
}
