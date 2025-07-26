import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/auth_viewmodel.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final navigate = Navigator.of(context);

    return AppBar(
      centerTitle: false,
      toolbarHeight: 80,
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
                return Text('${rewardViewModel.totalPoints} Points');
              },
            ),
          ],
        ),
      ),
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
              icon: authViewModel.isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.logout, color: Colors.white),
            );
          },
        ),
      ],
    );
  }
}
