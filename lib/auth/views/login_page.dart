import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/constants.dart';
import 'package:recipe_app/common/navigation/routes/routes.gr.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration:
                          getInputDecoration(placeholder: 'Enter email'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Enter Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration:
                          getInputDecoration(placeholder: 'Enter Password'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password',
                          style: TextStyle(
                            color: Color(0xffFF9C00),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(const DashboardRoute());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      indent: 40,
                      endIndent: 10,
                    )),
                    Text(
                      'Or Sign In with',
                      style: TextStyle(
                        color: Color(0xffD9D9D9),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 40,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 48,
                      child: MaterialButton(
                        onPressed: () {
                          ref.read(authControllerProvider).signInWithGoogle();
                        },
                        elevation: 3,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Image.asset(
                            'assets/google.png',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 48,
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 3,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Image.asset(
                            'assets/facebook.png',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xffFF9C00),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
