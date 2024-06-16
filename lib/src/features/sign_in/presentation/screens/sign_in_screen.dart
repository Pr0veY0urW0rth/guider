import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/features/sign_in/presentation/providers/sign_in_state_providers.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/sign_in_widgets.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signInNotifierProvider).email;
    final password = ref.watch(signInNotifierProvider).password;
    final isPasswordObscured =
        ref.watch(signInNotifierProvider).isPasswordObscured;
    final formStatus = ref.watch(signInNotifierProvider).status;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const SignInTitle(text: 'Guider'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SignInTitle(
                  text: 'Добро пожаловать',
                ),
                const Gap(20),
                SignInTextField(
                  hintText: 'Email',
                  onChanged: (email) => ref
                      .read(signInNotifierProvider.notifier)
                      .updateEmail(email),
                  validator: (value) => email.error?.getMessage(),
                ),
                const Gap(16),
                SignInTextField(
                  hintText: 'Пароль',
                  inputType: isPasswordObscured
                      ? TextInputType.text
                      : TextInputType.visiblePassword,
                  onChanged: (password) => ref
                      .read(signInNotifierProvider.notifier)
                      .updatePassword(password),
                  validator: (value) => password.error?.getMessage(),
                  obscureText: isPasswordObscured,
                  suffixIcon: PasswordVisibilityButton(
                    isPasswordObscured: isPasswordObscured,
                    onTap: () => ref
                        .read(signInNotifierProvider.notifier)
                        .changePasswordVisibility(),
                  ),
                ),
                const Gap(16),
                formStatus.isLoading
                    ? const CircularProgressIndicator()
                    : SignInButton(
                        'Войти',
                        enabled: ref.watch(signInNotifierProvider).formIsValid,
                        onPressed: () async {
                          await ref
                              .read(signInNotifierProvider.notifier)
                              .signIn();
                          if (context.mounted) {
                            if (formStatus.isFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Ошибка входа'),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                            if (formStatus.isSuccess) {
                              ref.invalidate(signInNotifierProvider);

                              context.go(GuiderNavigationHelper.mapPath);
                            }
                          }
                        },
                      ),
                const Gap(16),
                SignInLink(
                  onLinkTap: () =>
                      context.go(GuiderNavigationHelper.signUpPath),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
