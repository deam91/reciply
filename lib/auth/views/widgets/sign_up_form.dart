import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/auth/models/user_profile.dart';
import 'package:recipe_app/common/models/utils.dart';
import 'package:recipe_app/common/views/widgets/constants.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool obscurePassword = true;

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

  String? confirmPasswordValidator(String? confirmPassword) {
    final password = _passwordController.text;
    final text =
        Validator.isValidPassWordConfirmation(password, confirmPassword);
    if (text != null) {
      return text;
    }
    return null;
  }

  _signUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }
    signUpFormKey.currentState!.save();
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final occupation = _occupationController.text;
    final aboutMe = _aboutMeController.text;
    final userProfile = UserProfile(
      name: name,
      email: email,
      aboutMe: aboutMe,
      work: occupation,
      photoUrl: '',
      recipes: [],
      following: 0,
    );
    final resp = await ref
        .read(authControllerProvider.notifier)
        .signUp(userProfile, password);
    print("signUpForm -> $name");
    if (resp) context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Name',
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
            controller: _nameController,
            key: const Key('signup_name_form_field'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: getInputDecoration(placeholder: 'Name'),
          ),
          const SizedBox(
            height: 16,
          ),
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
            key: const Key('signup_email_form_field'),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: getInputDecoration(placeholder: 'Email'),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Password',
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
            key: const Key('signup_password_form_field'),
            validator: passwordValidator,
            obscureText: obscurePassword,
            controller: _passwordController,
            textInputAction: TextInputAction.next,
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
            height: 16,
          ),
          const Text(
            'Confirm Password',
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
            key: const Key('signup_confirm_password_form_field'),
            validator: confirmPasswordValidator,
            obscureText: obscurePassword,
            controller: _confirmPasswordController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscuringCharacter: '●',
            decoration:
                getInputDecoration(placeholder: 'Repeat Password').copyWith(
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
            height: 16,
          ),
          const Text(
            'Occupation',
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
            controller: _occupationController,
            key: const Key('signup_occupation_form_field'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: getInputDecoration(placeholder: 'Occupation'),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'About Me',
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
            controller: _aboutMeController,
            key: const Key('signup_aboutMe_form_field'),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            maxLength: 250,
            maxLines: 4,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: getInputDecoration(placeholder: 'About Me'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: _signUp,
            child: Consumer(
              builder: (context, ref, child) {
                final loading = ref.watch(authControllerProvider);
                if (loading == Status.registering) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      LoadingWidget(),
                    ],
                  );
                }
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
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
