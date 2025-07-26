import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/widgets/app_bar_widget.dart';
import 'package:loyalty_app/views/widgets/reward_list_widget.dart';
import 'package:provider/provider.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
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
            return RewardListWidget(
              items: rewardViewModel.rewards,
              rewardViewModel: rewardViewModel,
            );
          }
        },
      ),
    );
  }
}
