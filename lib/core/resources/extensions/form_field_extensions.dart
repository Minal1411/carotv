import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension FormKeyX on GlobalKey<FormBuilderState> {
  T value<T extends Object?>(String key) =>
      currentState?.fields[key]?.value as T;

  Map<String, dynamic>? get currentValue => currentState?.value;

  void update<T>(String key, T data) =>
      currentState?.fields[key]?.didChange(data);

  void updateAll(Map<String, dynamic> values) =>
      currentState?.patchValue(values);

  bool validateAndSaveForm() => currentState!.saveAndValidate();
}
