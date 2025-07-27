import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onSaved,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (labelText != null && labelText!.isNotEmpty)
            ? Text(
                labelText ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUnfocus,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          validator: validator,
          obscureText: obscureText,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
