import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';

import '../providers/sign_up_state_providers.dart';
import '../widgets/sign_up_widgets.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(signUpNotifierProvider).username;
    final phone = ref.watch(signUpNotifierProvider).phone;
    final email = ref.watch(signUpNotifierProvider).email;
    final password = ref.watch(signUpNotifierProvider).password;
    final repeatPassword = ref.watch(signUpNotifierProvider).repeatPassword;
    final isPasswordObscured =
        ref.watch(signUpNotifierProvider).isPasswordObscured;
    final isRepeatPasswordObscured =
        ref.watch(signUpNotifierProvider).isRepeatedPasswordObscured;
    final formStatus = ref.watch(signUpNotifierProvider).status;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const SignUpTitle(text: 'Guider'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SignUpTitle(
                  text: 'Регистрация',
                ),
                const Gap(10),
                SignUpTextField(
                  hintText: 'Имя пользователя',
                  onChanged: (username) => ref
                      .read(signUpNotifierProvider.notifier)
                      .updateUsername(username),
                  validator: (value) => username.error?.getMessage(),
                ),
                const Gap(8),
                SignUpTextField(
                  hintText: 'Номер телефона',
                  onChanged: (phone) => ref
                      .read(signUpNotifierProvider.notifier)
                      .updatePhone(phone),
                  validator: (value) => phone.error?.getMessage(),
                ),
                const Gap(8),
                SignUpTextField(
                  hintText: 'Email',
                  onChanged: (email) => ref
                      .read(signUpNotifierProvider.notifier)
                      .updateEmail(email),
                  validator: (value) => email.error?.getMessage(),
                ),
                const Gap(8),
                SignUpTextField(
                  hintText: 'Пароль',
                  inputType: isPasswordObscured
                      ? TextInputType.text
                      : TextInputType.visiblePassword,
                  onChanged: (password) => ref
                      .read(signUpNotifierProvider.notifier)
                      .updatePassword(password),
                  validator: (value) => password.error?.getMessage(),
                  obscureText: isPasswordObscured,
                  suffixIcon: PasswordVisibilityButton(
                    isPasswordObscured: isPasswordObscured,
                    onTap: () => ref
                        .read(signUpNotifierProvider.notifier)
                        .changePasswordVisibility(),
                  ),
                ),
                const Gap(8),
                SignUpTextField(
                  hintText: 'Повторите пароль',
                  inputType: isRepeatPasswordObscured
                      ? TextInputType.text
                      : TextInputType.visiblePassword,
                  onChanged: (repeatPassword) => ref
                      .read(signUpNotifierProvider.notifier)
                      .updateRepeatPassword(repeatPassword),
                  validator: (value) => repeatPassword.error?.getMessage(),
                  obscureText: isRepeatPasswordObscured,
                  suffixIcon: PasswordVisibilityButton(
                    isPasswordObscured: isRepeatPasswordObscured,
                    onTap: () => ref
                        .read(signUpNotifierProvider.notifier)
                        .changeRepeatPasswordVisibility(),
                  ),
                ),
                const Gap(8),
                formStatus.isLoading
                    ? const CircularProgressIndicator()
                    : SignUpButton(
                        'Создать аккаунт',
                        enabled: ref.watch(signUpNotifierProvider).formIsValid,
                        onPressed: () async {
                          await ref
                              .read(signUpNotifierProvider.notifier)
                              .signUp();
                          if (formStatus.isSuccess) {
                            ref.invalidate(signUpNotifierProvider);
                            if (context.mounted) {
                              context.go(GuiderNavigationHelper.mapPath);
                            }
                          }
                        },
                      ),
                const Gap(16),
                SignUpLink(
                  onLinkTap: () =>
                      context.go(GuiderNavigationHelper.signInPath),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
