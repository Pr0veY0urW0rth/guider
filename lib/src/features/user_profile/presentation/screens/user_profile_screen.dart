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
      ref.read(userProfileNotifierProvider.notifier).initUser();
    });
    final isEditingEnabled =
        ref.watch(userProfileNotifierProvider).isEditingEnabled;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: Padding(
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
                initalText:
                    ref.read(userProfileNotifierProvider).username.value,
                label: 'Имя пользователя',
                hintText: 'Имя пользователя',
                isEditable: isEditingEnabled,
                onChanged: (username) => ref
                    .read(userProfileNotifierProvider.notifier)
                    .updateUsername(username),
              ),
              const Gap(8),
              UserProfileField(
                initalText: ref.read(userProfileNotifierProvider).email.value,
                label: 'Email',
                hintText: 'Email',
                isEditable: isEditingEnabled,
                onChanged: (email) => ref
                    .read(userProfileNotifierProvider.notifier)
                    .updateEmail(email),
              ),
              const Gap(8),
              UserProfileField(
                initalText: ref.read(userProfileNotifierProvider).phone.value,
                label: 'Номер телефона',
                hintText: 'Номер телефона',
                isEditable: isEditingEnabled,
                onChanged: (phone) => ref
                    .read(userProfileNotifierProvider.notifier)
                    .updatePhone(phone),
              ),
              const Gap(16),
              UserProfileButton(
                isEditingEnabled ? 'Сохранить данные' : 'Изменить данные',
                onPressed: () => ref
                    .read(userProfileNotifierProvider.notifier)
                    .changeEditing(),
              ),
              const Gap(4),
              UserProfileLink(onLinkTap: () async {
                final Uri url = Uri.parse('https://nickkalibr.github.io/');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              }),
              const Gap(8),
              UserProfileButton(
                'Выйти из аккаунта',
                onPressed: () => context.go(GuiderNavigationHelper.signInPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}
