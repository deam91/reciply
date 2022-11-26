import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/models/utils.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  void _showErroMessage(String message) {
    showSnackBarMessage(context, message);
  }

  void togglePassVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  String? passwordValidator(String? value) {
    final text = Validator.isValidPassWord(value);
    if (text != null) {
      return text;
    }
    return null;
  }

  String? emailValidator(String? value) {
    final text = Validator.isValidEmail(value);
    if (text != null) {
      return text;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      if (next == Status.authError) {
        debugPrint('error...');
        final error = ref.read(authControllerProvider.notifier).error;
        _showErroMessage(error);
      }
    });
    debugPrint("BUILD LOGIN_FORM");
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Email',
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
            validator: emailValidator,
            controller: _emailController,
            key: const Key('signin_email_form_field'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: getInputDecoration(placeholder: 'Enter email'),
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
            validator: passwordValidator,
            obscureText: obscurePassword,
            controller: _passwordController,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscuringCharacter: '●',
            decoration:
                getInputDecoration(placeholder: 'Enter Password').copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                color: const Color(0xffB3B3B3),
                onPressed: () {
                  togglePassVisibility();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }
              formKey.currentState!.save();
              final email = _emailController.text;
              final password = _passwordController.text;
              ref.read(authControllerProvider.notifier).signIn(email, password);
            },
            child: Consumer(
              builder: (context, ref, child) {
                final loading = ref.watch(authControllerProvider);
                if (loading == Status.authenticating) {
                  return const LoadingWidget();
                }
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
