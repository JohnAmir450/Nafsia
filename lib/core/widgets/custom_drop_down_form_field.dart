import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final bool needsValidation;

  const CustomDropdownFormField({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.contentPadding,
    this.needsValidation = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      validator: needsValidation
          ? validator ??
              (val) {
                if (val == null || val.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              }
          : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:  TextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
        contentPadding: contentPadding,
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: buildBorder(4),
        enabledBorder: buildBorder(4),
        focusedBorder: buildBorder(4),
      ),
      items: items
          .map((String gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ))
          .toList(),
    );
  }
  OutlineInputBorder buildBorder(double? borderRadius) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
         borderRadius?? 4.0,
        ),
        borderSide: const BorderSide(color: Color(0xffE6E9E9)));
  }
}
