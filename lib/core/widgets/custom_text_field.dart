import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final int maxLines;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isObscured;
  final void Function(String)? onChanged;
  final bool needsValidation;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? initialValue;
  final double? borderRadius;
  final bool  readOnly;
  final void Function(String?)? onSaved;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.initialValue,
    this.textInputType,
    this.borderRadius,
    this.validator,
    this.readOnly=false,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.isObscured,
    this.maxLines = 1,
    this.contentPadding,
    this.needsValidation=true,
    this.onFieldSubmitted, this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

    onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      initialValue: initialValue,
      onSaved:onSaved ,
      readOnly: readOnly,
      obscureText: isObscured ?? false,
      onChanged: onChanged,
      validator:needsValidation? validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      }:null,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        hintMaxLines: maxLines,
        
        labelText: labelText,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xff949D9E),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: buildBorder(borderRadius),
        enabledBorder: buildBorder(borderRadius),
        focusedBorder: buildBorder(borderRadius),
      ),
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
