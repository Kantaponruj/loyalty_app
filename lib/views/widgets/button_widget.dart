import 'package:flutter/material.dart';
import 'package:loyalty_app/views/utils/themes/color.dart';

enum ButtonType { primary, secondary }

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonType type;
  final bool isDisabled;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.type = ButtonType.primary,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return type == ButtonType.primary
        ? ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            ),
            child: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  )
                : Text(text),
          )
        : OutlinedButton(
            onPressed: isDisabled ? null : onPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              side: BorderSide(color: AppColors.primaryColor),
            ),
            child: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : Text(text, style: TextStyle(color: AppColors.primaryColor)),
          );
  }
}
