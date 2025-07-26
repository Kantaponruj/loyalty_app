import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/themes/color.dart';
import 'package:loyalty_app/viewmodels/auth_viewmodel.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final navigate = Navigator.of(context);

    return AppBar(
      centerTitle: false,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<AuthViewModel>(
              builder: (context, authViewModel, child) {
                return Text(
                  authViewModel.isAuthenticated
                      ? 'สวัสดี, คุณ ${authViewModel.currentUser?.name ?? 'User'}'
                      : 'Please log in',
                );
              },
            ),
            SizedBox(height: 8),
            Consumer<RewardViewModel>(
              builder: (context, rewardViewModel, child) {
                return RichText(
                  text: TextSpan(
                    text: rewardViewModel.isLoading
                        ? "0"
                        : rewardViewModel.totalPoints,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                );
              },
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 16.0),
      actions: [
        Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            return IconButton(
              onPressed: authViewModel.isLoading
                  ? null
                  : () async {
                      await authViewModel.logout();
                      navigate.pushReplacementNamed('/login');
                    },
              icon: const Icon(Icons.logout, color: AppColors.primaryColor),
            );
          },
        ),
      ],
    );
  }
}
