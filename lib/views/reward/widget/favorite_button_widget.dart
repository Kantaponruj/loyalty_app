import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/themes/color.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final bool isSelected;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const FavoriteButtonWidget({
    super.key,
    required this.isSelected,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor:
            backgroundColor ?? AppColors.whiteColor.withValues(alpha: 0.5),
        shape: const CircleBorder(),
      ),
      onPressed: onPressed,
      icon: Icon(
        isSelected ? Icons.favorite : Icons.favorite_border,
        color: isSelected ? AppColors.primaryColor : AppColors.primaryTextColor,
      ),
    );
  }
}
