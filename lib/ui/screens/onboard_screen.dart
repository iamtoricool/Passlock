import 'package:flutter/material.dart';
import 'package:passblock/ui/app_theme/design_constants.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OnboardItems(),
            GetTextButton(
              isFilled: true,
              title: 'Register',
            ),
            const SizedBox(
              height: 18,
            ),
            GetTextButton(
              isFilled: false,
              title: 'Already have an account',
            )
          ],
        ),
      ),
    );
  }
}
