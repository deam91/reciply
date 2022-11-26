import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/views/widgets/providers_login.dart';
import 'package:recipe_app/auth/views/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD LOGIN_PAGE");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Let’s help you set up your account, it won’t take long.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const SignUpForm(),
                ProviderLogin(
                  bottomText: 'Already a member?',
                  bottomButtonText: 'Sign In',
                  bottomButtonAction: () {
                    context.router.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
