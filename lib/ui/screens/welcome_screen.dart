import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/routing/routes.dart';
import 'package:notes_app/core/theming/colors.dart';
import 'package:notes_app/core/theming/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/welcome_image.svg'),
                const SizedBox(height: 32),
                Text(
                  'Daily Notes',
                  style: TextStyles.font24WhiteBold,
                ),
                const SizedBox(height: 32),
                Text(
                  'Simplify note-taking. Organize thoughts and tasks efficiently.',
                  style: TextStyles.font14GrayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                _textButton(context)
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _textButton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          ColorsManager.purple,
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(164, 64),
        ),
      ),
      onPressed: () {
        _saveWelcomeShown();
        Get.toNamed(Routes.notes);
      },
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }

  Future<void> _saveWelcomeShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('welcomeShown', true);
  }
}
