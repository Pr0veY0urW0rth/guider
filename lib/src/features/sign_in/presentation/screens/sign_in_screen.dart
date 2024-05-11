import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/features/sign_in/presentation/providers/sign_in_controller.dart';
import 'package:guider/src/features/sign_in/presentation/providers/sign_in_state.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/password_visibility_button.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/sign_in_button.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/sign_in_link.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/sign_in_textfield.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(signInNotifierProvider).username;
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
          title: const Text('Guider'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignInTextField(
                  label: 'Имя пользователя',
                  hintText: 'Введите имя пользователя',
                  onChanged: (username) => ref
                      .read(signInNotifierProvider.notifier)
                      .updateUsername(username),
                  validator: (value) => username.error?.getMessage(),
                ),
                SignInTextField(
                  label: 'Пароль',
                  hintText: 'Введите пароль',
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
                formStatus.isLoading
                    ? const CircularProgressIndicator()
                    : SignInButton(
                        'Войти',
                        enabled: ref.watch(signInNotifierProvider).formIsValid,
                        onPressed: () async {
                          await ref
                              .read(signInNotifierProvider.notifier)
                              .signIn();
                          if (ref
                              .read(signInNotifierProvider)
                              .status
                              .isSuccess) {
                            ref.invalidate(signInNotifierProvider);
                            if (context.mounted) {
                              context.go(GuiderNavigationHelper.mapPath);
                            }
                          }
                        },
                      ),
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
