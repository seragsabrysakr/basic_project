import 'package:flutter/material.dart';
import 'package:delivery/core/app_utils/app_extensions.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final bool align;
  final bool enable;
  final String? initialValue;
  final int? max;
  final int? min;
  final double? width;
  final double? hi;
  final String? Function(String?)? validator;
  final String? hint;
  final TextEditingController? controller;
  final IconData? suffix;
  final Widget? prefix;
  final TextInputType? type;
  final VoidCallback? visiblpass;
  final VoidCallback? onedit;
  final double radius;

  final VoidCallback? ontap;
  final FocusNode? focusNode;
  final TextInputAction? action;
  const CustomTextField(
      {this.controller,
      this.align = true,
      this.enable = true,
      this.action,
      this.initialValue,
      this.focusNode,
      required this.hint,
      this.max = 1,
      this.min,
      this.obscure = false,
      this.onedit,
      this.suffix,
      this.type,
      required this.validator,
      this.visiblpass,
      Key? key,
      this.prefix,
      this.ontap,
      this.radius = 18,
      this.width,
      this.hi = 6.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
 final ValueNotifier<TextDirection> _textDir =
      ValueNotifier(TextDirection.ltr);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(radius.h)),
          width: width ??80.w,
          child: TextFormField(
            onTap: ontap,
            enabled: enable,
            obscuringCharacter: '*',
            onEditingComplete: onedit,
            textInputAction: action,
            maxLines: max,
            minLines: min,
            initialValue: initialValue,
            controller: controller,
            style: TextStyle(
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            cursorColor: Colors.white,
            keyboardType: type,
            obscureText: obscure,
            validator: validator,
            decoration: buildInputDecoration(),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2.0.h),

        // errorText: '',
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        suffixIcon: suffix != null
            ? GestureDetector(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 3.w, end: 4.w),
                  child: Icon(
                    suffix,
                    color: Colors.grey,
                  ),
                ),
                onTap: visiblpass,
              )
            : SizedBox(
                width: 5.w,
              ),
        prefixIcon: GestureDetector(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 4.w, end: 3.w),
            child: prefix,
          ),
          onTap: visiblpass,
        ),
        labelText: hint!,
        labelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius.h),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius.h),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius.h),
            borderSide: const BorderSide(color: Colors.white, width: 2)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.h),
          borderSide: const BorderSide(color: Colors.red),
        ));
  }
}
