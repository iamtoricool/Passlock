import 'package:flutter/material.dart';
import 'package:passblock/ui/app_theme/design_constants.dart';
import 'package:passblock/ui/screens/register_screen.dart';

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
            const OnboardItems(),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  )),
              child: const GetTextButton(
                isFilled: true,
                title: 'Register',
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const GetTextButton(
              isFilled: false,
              title: 'Already have an account',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
