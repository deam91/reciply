import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/views/widgets/login_form.dart';
import 'package:recipe_app/auth/views/widgets/providers_login.dart';
import 'package:recipe_app/common/navigation/routes/routes.gr.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("BUILD LOGIN_PAGE");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello,',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const LoginForm(),
                ProviderLogin(
                  bottomText: 'Don`t have an account?',
                  bottomButtonText: 'Sign Up',
                  bottomButtonAction: () {
                    context.router.push(const SignUpRoute());
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
