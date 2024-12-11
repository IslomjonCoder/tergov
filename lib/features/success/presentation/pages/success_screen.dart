import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/redirect/pages/redirect_screen.dart';
import 'package:tergov/features/success/presentation/pages/call_screen.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: context.theme.copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
            foregroundColor: TColors.white,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'telegram',
              onPressed: () => redirectToTelegram('tergov_uz'),
              child: const Icon(Icons.telegram),
            ),
            const Gap(16),
            FloatingActionButton(
              heroTag: 'call',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CallScreen()),
                );
              },
              child: const Icon(Icons.call),
            ),
            const Gap(16),
            FloatingActionButton.extended(
              heroTag: 'finish',
              onPressed: () {
                Navigator.of(context)
                    .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const RedirectScreen()), (route) => false);
              },
              label: Text(S.of(context).finish),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Image.asset(
            'assets/images/img.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

Future<void> redirectToTelegram(String username) async {
  final String telegramUrl = 'https://t.me/$username';

  if (await canLaunchUrl(Uri.parse(telegramUrl))) {
    await launchUrl(Uri.parse(telegramUrl), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Telegram URL';
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final String telUrl = 'tel:$phoneNumber';

  if (await canLaunchUrl(Uri.parse(telUrl))) {
    await launchUrl(Uri.parse(telUrl), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch phone call';
  }
}
