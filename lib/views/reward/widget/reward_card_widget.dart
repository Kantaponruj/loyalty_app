import 'package:flutter/material.dart';
import 'package:loyalty_app/views/reward/widget/favorite_button_widget.dart';
import 'package:loyalty_app/utils/format.dart';

class RewardCardWidget extends StatelessWidget {
  final String itemName;
  final int itemRewardPoints;
  final String itemImageUrl;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const RewardCardWidget({
    super.key,
    required this.itemName,
    required this.itemRewardPoints,
    required this.itemImageUrl,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(itemImageUrl, fit: BoxFit.fill),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: FavoriteButtonWidget(
                    isSelected: isFavorite,
                    onPressed: onFavoriteToggle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${pointFormat(itemRewardPoints)} Points',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
