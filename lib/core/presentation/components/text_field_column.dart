import 'package:carotv/core/presentation/components/decorations.dart';
import 'package:carotv/core/resources/app_colors.dart';
import 'package:carotv/core/resources/app_styles.dart';
import 'package:carotv/core/resources/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextFieldColumn extends StatelessWidget {
  const TextFieldColumn({
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
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? extraValidator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyle.mediumText16.copyWith(
              color: AppColors.primary,
            ),
          ).pY(10.h),
          DecoratedBox(
            decoration: getShadowDecoration(),
            child: FormBuilderTextField(
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                extraValidator ?? (value) => null,
              ]),
              initialValue: initialValue,
              enabled: isEditable,
              onChanged: onChanged,
              onSaved: onSaved,
              textInputAction: isNext == true ? TextInputAction.next : null,
              controller: controller,
              name: fieldName,
              keyboardType: dateTimeKeyboard == true
                  ? TextInputType.datetime
                  : numericKeyboard == true
                      ? TextInputType.number
                      : TextInputType.text,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: InputBorder.none,
                hintText: hint,
                hintStyle: AppTextStyle.regularText12.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ).pY(2.h),
    ).pY(6.h);
  }
}
