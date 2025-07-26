import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/reward/widget/favorite_button_widget.dart';
import 'package:loyalty_app/utils/format.dart';
import 'package:loyalty_app/utils/themes/color.dart';
import 'package:loyalty_app/views/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class RewardDetailPage extends StatefulWidget {
  const RewardDetailPage({super.key});

  @override
  State<RewardDetailPage> createState() => _RewardDetailPageState();
}

class _RewardDetailPageState extends State<RewardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RewardViewModel>(
      builder: (context, rewardViewModel, child) {
        final currentReward = rewardViewModel.currentReward;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: false,
            title: Text(
              currentReward?.name ?? 'Reward Detail',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: currentReward == null
              ? SizedBox.shrink()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          currentReward.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitleSection(
                              title: currentReward.name,
                              point: currentReward.rewardPoints,
                              isFavorite: rewardViewModel.isFavorite(
                                currentReward,
                              ),
                              onFavoriteToggle: () {
                                rewardViewModel.toggleFavorite(currentReward);
                              },
                            ),
                            const SizedBox(height: 36.0),
                            _buildDetailSection(
                              title: 'Detail',
                              content: currentReward.rewardDescription,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.fromLTRB(24.0, 24, 24.0, 32.0),
            color: AppColors.whiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Points: ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      rewardViewModel.totalPoints,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                ButtonWidget(
                  text: 'Redeem',
                  isDisabled: !rewardViewModel.isRewardAvailable(
                    currentReward!,
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildConfirmationDialog(
                        totalPoints: rewardViewModel.totalPoints,
                        redeemPoint: pointFormat(currentReward.rewardPoints),
                        onConfirm: () async {
                          rewardViewModel.redeemReward(currentReward);
                          // Close the dialog and navigate back
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                          // Show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You have redeemed ${currentReward.name} successfully!',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConfirmationDialog({
    VoidCallback? onConfirm,
    required String totalPoints,
    required String redeemPoint,
  }) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      insetPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: EdgeInsets.all(32.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Confirm Reward Redemption',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16.0),
          RichText(
            text: TextSpan(
              text: 'Current: ',
              style: Theme.of(context).textTheme.titleSmall!,
              children: [
                TextSpan(text: totalPoints),
                TextSpan(text: ' Points'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          RichText(
            text: TextSpan(
              text: 'Redeem: ',
              style: Theme.of(context).textTheme.titleSmall!,
              children: [
                TextSpan(text: redeemPoint),
                TextSpan(text: ' Points'),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: ButtonWidget(
                  text: 'Cancel',
                  type: ButtonType.secondary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 16.0),
              Flexible(
                flex: 1,
                child: ButtonWidget(text: 'Confirm', onPressed: onConfirm),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection({
    required String title,
    required int point,
    required bool isFavorite,
    VoidCallback? onFavoriteToggle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16.0),
              Text(
                "Redeem amount",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  text: pointFormat(point),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: ' Points',
                      style: Theme.of(context).textTheme.titleSmall!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.0),
        FavoriteButtonWidget(
          isSelected: isFavorite,
          onPressed: onFavoriteToggle,
          backgroundColor: AppColors.greyColor.withValues(alpha: 0.3),
        ),
      ],
    );
  }

  Widget _buildDetailSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4.0),
        Text(content),
      ],
    );
  }
}
