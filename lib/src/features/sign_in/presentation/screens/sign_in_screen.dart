import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/features/sign_in/presentation/notifier/sign_in_controller.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/sign_in_button.dart';
import 'package:guider/src/features/sign_in/presentation/widgets/sign_in_textfield.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(signInNotifierProvider).username;
    final password = ref.watch(signInNotifierProvider).password;
    final isPasswordObscured =
        ref.watch(signInNotifierProvider).isPasswordObscured;
    return GestureDetector(
      onTap: () => null,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SignInTextField(
                label: 'Имя пользователя',
                onChanged: (username) => ref
                    .read(signInNotifierProvider.notifier)
                    .updateUsername(username),
                validator: (value) => username.error?.getMessage(),
              ),
              SignInTextField(
                label: 'Пароль',
                inputType: isPasswordObscured
                    ? TextInputType.text
                    : TextInputType.visiblePassword,
                onChanged: (password) => ref
                    .read(signInNotifierProvider.notifier)
                    .updatePassword(password),
                validator: (value) => password.error?.getMessage(),

                //obscureText: isPasswordObscured,
              ),
              SignInButton(
                'Войти',
                enabled: ref.watch(signInNotifierProvider).formIsValid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
