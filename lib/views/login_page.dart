import 'package:flutter/material.dart';
import 'package:loyalty_app/viewmodels/auth_viewmodel.dart';
import 'package:loyalty_app/viewmodels/reward_viewmodel.dart';
import 'package:loyalty_app/views/widgets/button_widget.dart';
import 'package:loyalty_app/views/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigate = Navigator.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36.0),
          child: Consumer<AuthViewModel>(
            builder: (context, authViewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: SizedBox(
                      height: 250,
                      child: Image.asset(
                        'assets/images/undraw_login.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 40),

                  // Email Input
                  TextFormFieldWidget(
                    controller: _emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),

                  // Password Input
                  TextFormFieldWidget(
                    controller: _passwordController,
                    prefixIcon: Icons.lock,
                    hintText: 'Password',
                  ),

                  const SizedBox(height: 60),

                  // Login Button
                  ButtonWidget(
                    text: 'Login',
                    isLoading: authViewModel.isLoading,
                    onPressed: () async {
                      final rewardViewModel = Provider.of<RewardViewModel>(
                        context,
                        listen: false,
                      );

                      await authViewModel.login(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (authViewModel.isAuthenticated) {
                        // Wait for rewards to finish loading before navigating
                        await rewardViewModel.fetchRewards();

                        // Ensure loading is finished before navigating
                        if (!authViewModel.isLoading &&
                            !rewardViewModel.isLoading) {
                          navigate.pushReplacementNamed('/home');
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // Error Message
                  if (authViewModel.errorMessage != null)
                    Text(
                      authViewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
