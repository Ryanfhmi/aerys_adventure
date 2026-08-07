import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// CustomEditText - A flexible, reusable text input field with optional left icon,
/// password toggle, and full validation support.
///
/// Arguments:
/// - [placeholder]: Hint text for the input field
/// - [inputType]: The keyboard/input type (text, email, password)
/// - [leftImagePath]: Path to the left icon image
/// - [leftImageWidth]: Width of the left icon
/// - [leftImageHeight]: Height of the left icon
/// - [controller]: TextEditingController for the field
/// - [validator]: Validation function for form validation
/// - [onChanged]: Callback when text changes
/// - [isPassword]: Whether the field is a password field with toggle
/// - [margin]: Optional margin around the field
class CustomEditText extends StatefulWidget {
  const CustomEditText({
    Key? key,
    this.placeholder,
    this.inputType,
    this.leftImagePath,
    this.leftImageWidth,
    this.leftImageHeight,
    this.controller,
    this.validator,
    this.onChanged,
    this.isPassword,
    this.margin,
    this.onTap,
  }) : super(key: key);

  final String? placeholder;
  final TextInputType? inputType;
  final String? leftImagePath;
  final double? leftImageWidth;
  final double? leftImageHeight;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool? isPassword;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final bool isPasswordField = widget.isPassword ?? false;
    final double leftImgWidth = widget.leftImageWidth ?? 40;
    final double leftImgHeight = widget.leftImageHeight ?? 34;
    final double leftPadding = isPasswordField ? 26.h : 48.h;

    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType ?? TextInputType.text,
        obscureText: isPasswordField ? _obscureText : false,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        validator: widget.validator,
        style: TextStyleHelper.instance.label10LightInter,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: TextStyleHelper.instance.label10LightInter,
          filled: true,
          fillColor: appTheme.color7FD9D9,
          contentPadding: EdgeInsets.only(
            top: 4.h,
            right: 12.h,
            bottom: 4.h,
            left: leftPadding,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
            borderSide: BorderSide(color: appTheme.color7FD9D9, width: 1.h),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
            borderSide: BorderSide(color: appTheme.color7FD9D9, width: 1.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
            borderSide: BorderSide(color: appTheme.blue_gray_100, width: 1.h),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
            borderSide: BorderSide(color: appTheme.redAccentCustom, width: 1.h),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
            borderSide: BorderSide(color: appTheme.redAccentCustom, width: 1.h),
          ),
          prefixIcon: widget.leftImagePath != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: CustomImageView(
                    imagePath: widget.leftImagePath!,
                    width: leftImgWidth.h,
                    height: leftImgHeight.h,
                    fit: BoxFit.contain,
                  ),
                )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: leftImgWidth.h + 16.h,
            minHeight: leftImgHeight.h,
          ),
          suffixIcon: isPasswordField
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: appTheme.white_A700,
                    size: 18.h,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
