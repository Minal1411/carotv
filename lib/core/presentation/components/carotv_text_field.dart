import 'package:carotv/core/presentation/components/decorations.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CarotvTextField extends StatefulWidget {
  const CarotvTextField({
    Key? key,
    required this.fieldName,
    required this.hint,
    required this.label,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.isEditable = true,
    this.initialValue,
    this.extraValidator,
    this.isNext,
    this.dateTimeKeyboard,
    this.numericKeyboard,
    this.isPassword = false,
    this.prefixIcon,
  }) : super(key: key);
  final String fieldName;
  final String hint;
  final String label;
  final TextEditingController? controller;
  final ValueSetter<String?>? onChanged;
  final bool isEditable;
  final String? initialValue;
  final bool? dateTimeKeyboard;
  final bool? numericKeyboard;
  final bool? isNext;
  final bool? isPassword;
  final Icon? prefixIcon;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? extraValidator;

  @override
  State<CarotvTextField> createState() => _CarotvTextFieldState();
}

class _CarotvTextFieldState extends State<CarotvTextField> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: getShadowDecoration(),
      child: FormBuilderTextField(
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          widget.extraValidator ?? (value) => null,
        ]),
        initialValue: widget.initialValue,
        enabled: widget.isEditable,
        onChanged: widget.onChanged,
        obscureText: _isObscure ? true : false,
        onSaved: widget.onSaved,
        textInputAction: widget.isNext == true ? TextInputAction.next : null,
        controller: widget.controller,
        name: widget.fieldName,
        keyboardType: widget.dateTimeKeyboard == true
            ? TextInputType.datetime
            : widget.numericKeyboard == true
                ? TextInputType.number
                : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          prefix: SizedBox(width: 10.w),
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: InputBorder.none,
          hintText: widget.hint,
          hintStyle: AppTextStyle.regularText18.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
