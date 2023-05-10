import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final TextEditingController? controller;
  final String Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  const TextFieldContainer(
      {Key? key,
      this.controller,
      this.validator,
      this.hintText,
      this.suffixIcon,
      this.maxLines,
      this.textInputAction,
      this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1AB8DB),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        suffixIcon: suffixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF095769),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1AB8DB),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xCC000000),
          fontWeight: FontWeight.w400,
          fontFamily: 'SF-Pro',
          fontSize: 17,
        ),
      ),
    );
  }
}
