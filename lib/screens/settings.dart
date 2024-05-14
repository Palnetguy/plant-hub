import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/widgets/midx_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/toggle_button_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MidxAppbar(
            title: 'Settings',
            goBack: () {
              Navigator.pop(context);
            },
          ),
          ListView(
            shrinkWrap: true,
            children: const [
              SettingModuleEnableNotification(),
              SettingModuleNormal(
                icon: Icons.dark_mode,
                text: 'Dark mode',
              ),
              SettingModuleNormal(
                icon: Icons.favorite_border_rounded,
                text: 'Rate App',
              ),
              SettingModuleNormal(
                icon: Icons.share_outlined,
                text: 'Share App',
              ),
              SettingModuleNormal(
                icon: Icons.lock_outline_rounded,
                text: 'Privacy Policy',
              ),
              SettingModuleNormal(
                icon: Icons.feed_outlined,
                text: 'Terms and Conditions',
              ),
              SettingModuleNormal(
                icon: Icons.cookie,
                text: 'Cookies Policy',
              ),
              SettingModuleNormal(
                icon: Icons.contact_mail_rounded,
                text: 'Contact',
              ),
              SettingModuleNormal(
                icon: Icons.feedback_outlined,
                text: 'Feedback',
              ),
              SettingModuleNormal(
                icon: Icons.logout_rounded,
                text: 'Logout',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingModuleNormal extends StatelessWidget {
  final dynamic icon;
  final String text;
  const SettingModuleNormal({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.red,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Icon(
              icon,
              size: 24,
              color: buttonColor,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: buttonColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class SettingModuleEnableNotification extends StatelessWidget {
  const SettingModuleEnableNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFD7D7D7),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.black.withOpacity(.4),
            blurRadius: 3,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  size: 24,
                  color: buttonColor,
                ),
              ),
              const Text(
                'Notification',
                style: TextStyle(
                  color: buttonColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          // toggleButton
          ToggleButtonWidget(
            margin: const EdgeInsets.only(right: 20),
          ),
        ],
      ),
    );
  }
}
