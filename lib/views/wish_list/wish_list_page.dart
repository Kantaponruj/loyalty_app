import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/widgets/reward_list_widget.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Text(
                'Wish List',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded(
              child: Consumer<RewardViewModel>(
                builder: (context, rewardViewModel, child) {
                  // If the rewards are still loading, show a loading indicator
                  if (rewardViewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                    // If there are no rewards available
                  } else if (rewardViewModel.favoriteRewards.isEmpty) {
                    return const Center(
                      child: Text(
                        'No items in your wish list.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                    // Display the rewards in a grid view
                  } else {
                    return RewardListWidget(
                      items: rewardViewModel.favoriteRewards,
                      rewardViewModel: rewardViewModel,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
