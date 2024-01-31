import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaroTvTextField extends StatelessWidget {
  const CaroTvTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.type = TextInputType.text,
    this.obscureText = false,
    this.showCursor = true,
    this.alignment = TextAlign.start,
    this.textStyle,
    this.hintStyle,
    this.suffix,
    this.prefix,
    this.validator,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.fillColor = Colors.white,
    this.autoFocus = false,
    this.borderRadius = 25,
  }) : super(key: key);

  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final TextInputType type;
  final bool obscureText;
  final bool autoFocus;
  final bool showCursor;
  final Widget? suffix;
  final Widget? prefix;
  final Color? fillColor;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final TextAlign alignment;
  final double borderRadius;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      validator: validator,
      textAlign: alignment,
      showCursor: showCursor,
      keyboardType: type,
      autofocus: autoFocus,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefix,
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodySmall,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        labelStyle: Theme.of(context).textTheme.bodySmall,
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
