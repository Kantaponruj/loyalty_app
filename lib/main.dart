import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/auth_viewmodel.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/home_page.dart';
import 'package:loyalty_app/views/login_page.dart';
import 'package:loyalty_app/views/reward/reward_detail_page.dart';
import 'package:loyalty_app/views/utils/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => RewardViewModel()),
      ],
      child: MaterialApp(
        title: 'Loyalty Demo App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            // Check if a user is currently logged in.
            if (authViewModel.isAuthenticated) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/rewardDetail': (context) => const RewardDetailPage(),
        },
      ),
    );
  }
}
