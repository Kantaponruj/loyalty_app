import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/reward/widget/reward_card_widget.dart';
import 'package:loyalty_app/views/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RewardViewModel>(context, listen: false).fetchRewards();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Consumer<RewardViewModel>(
        builder: (context, rewardViewModel, child) {
          // If the rewards are still loading, show a loading indicator
          if (rewardViewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
            // If there are no rewards available
          } else if (rewardViewModel.rewards.isEmpty) {
            return const Center(
              child: Text(
                'Unavailable rewards at the moment.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
            // Display the rewards in a grid view
          } else {
            return rewardViewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0, // spacing between rows
                      crossAxisSpacing: 10.0, // spacing between columns
                      childAspectRatio: 0.6,
                    ),
                    padding: EdgeInsets.all(8.0),
                    itemCount: rewardViewModel.rewards.length,
                    itemBuilder: (context, index) {
                      final item = rewardViewModel.rewards[index];

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
        },
      ),
    );
  }
}
