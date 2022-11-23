import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';
import 'package:recipe_app/common/views/widgets/loading.dart';

class ProviderLogin extends ConsumerWidget {
  const ProviderLogin({
    super.key,
    required this.bottomText,
    required this.bottomButtonText,
    this.bottomButtonAction,
  });
  final String bottomText;
  final String bottomButtonText;
  final Function()? bottomButtonAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
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
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: MaterialButton(
                height: 48,
                onPressed: () {
                  ref.read(authControllerProvider.notifier).signInWithGoogle();
                },
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Consumer(
                  builder: (context, ref, child) {
                    final status = ref.watch(authControllerProvider);
                    switch (status) {
                      case Status.authenticatingWithGoogle:
                        return const LoadingWidget();
                      case Status.authError:
                        return child!;
                      default:
                        return child!;
                    }
                  },
                  child: Image.asset(
                    'assets/google.png',
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bottomText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: bottomButtonAction,
              child: Text(
                bottomButtonText,
                style: const TextStyle(
                  color: Color(0xffFF9C00),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
