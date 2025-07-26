import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
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
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          validator: (value) => value == null || value.isEmpty
              ? 'This field cannot be empty'
              : null,
        ),
      ],
    );
  }
}
