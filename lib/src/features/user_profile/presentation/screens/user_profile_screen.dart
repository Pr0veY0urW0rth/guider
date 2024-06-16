import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/features/user_profile/presentation/providers/user_profile_state_providers.dart';
import 'package:guider/src/features/user_profile/presentation/widgets/user_profile_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await ref.read(userProfileNotifierProvider.notifier).initUser();
    });
    final username = ref.watch(userProfileNotifierProvider).username;
    final email = ref.watch(userProfileNotifierProvider).email;
    final phone = ref.watch(userProfileNotifierProvider).phone;
    final formIsValid = ref.watch(userProfileNotifierProvider).formIsValid;

    final isEditingEnabled =
        ref.watch(userProfileNotifierProvider).isEditingEnabled;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: username.value.isEmpty
          ? const CircularProgressIndicator(
              color: Colors.blueAccent,
            )
          : Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        'https://static.tildacdn.com/tild6338-3666-4133-a633-643664333838/photo.jpg',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(10),
                    UserProfileField(
                      initalText: username.value,
                      label: 'Имя пользователя',
                      hintText: 'Имя пользователя',
                      isEditable: isEditingEnabled,
                      validator: (value) => username.error?.getMessage(),
                      onChanged: (username) => ref
                          .read(userProfileNotifierProvider.notifier)
                          .updateUsername(username),
                    ),
                    const Gap(12),
                    UserProfileField(
                      initalText: email.value,
                      label: 'Email',
                      hintText: 'Email',
                      isEditable: isEditingEnabled,
                      validator: (value) => email.error?.getMessage(),
                      onChanged: (email) => ref
                          .read(userProfileNotifierProvider.notifier)
                          .updateEmail(email),
                    ),
                    const Gap(12),
                    UserProfileField(
                      initalText: phone.value,
                      label: 'Номер телефона',
                      hintText: 'Номер телефона',
                      isEditable: isEditingEnabled,
                      validator: (value) => phone.error?.getMessage(),
                      onChanged: (phone) => ref
                          .read(userProfileNotifierProvider.notifier)
                          .updatePhone(phone),
                    ),
                    const Gap(16),
                    UserProfileButton(
                      enabled: formIsValid,
                      isEditingEnabled ? 'Сохранить данные' : 'Изменить данные',
                      onPressed: () => ref
                          .read(userProfileNotifierProvider.notifier)
                          .changeEditing(),
                    ),
                    const Gap(4),
                    UserProfileLink(onLinkTap: () async {
                      final Uri url =
                          Uri.parse('https://nickkalibr.github.io/');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    }),
                    const Gap(8),
                    UserProfileButton(
                      'Выйти из аккаунта',
                      onPressed: () =>
                          context.go(GuiderNavigationHelper.signInPath),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
