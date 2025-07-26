import 'package:flutter/material.dart';
import 'package:loyalty_app/models/reward.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/reward/widget/reward_card_widget.dart';

class RewardListWidget extends StatelessWidget {
  final List<Reward> items;
  final RewardViewModel rewardViewModel;

  const RewardListWidget({
    super.key,
    required this.items,
    required this.rewardViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0, // spacing between rows
        crossAxisSpacing: 10.0, // spacing between columns
        childAspectRatio: 0.6,
      ),
      padding: EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return RewardCardWidget(
          itemName: item.name,
          itemRewardPoints: item.rewardPoints,
          itemImageUrl: item.imageUrl,
          isFavorite: rewardViewModel.isFavorite(item),
          onFavoriteToggle: () async {
            // Handle favorite toggle action
            rewardViewModel.toggleFavorite(item);
          },
          onTap: () async {
            final navigate = Navigator.of(context);

            rewardViewModel.setCurrentReward(item);

            navigate.pushNamed('/rewardDetail');
          },
        );
      },
    );
  }
}
