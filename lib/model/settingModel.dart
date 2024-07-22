import 'package:flutter/material.dart';

final Map<String, Map<String, dynamic>> settingMenu = {
  'Account': {
    'icon': Icons.person_outline_rounded,
    'title': const Text(
      'Account',
    ),
    'onTap': () {},
  },
  'Notification': {
    'icon': Icons.notifications_outlined,
    'title': const Text(
      'Notification',
    ),
    'onTap': () {},
  },
  'Appearance': {
    'icon': Icons.email_outlined,
    'title': const Text(
      'Appearance',
    ),
    'onTap': () {},
  },
  'Privacy & Security': {
    'icon': Icons.lock_outlined,
    'title': const Text(
      'Privacy & Security',
    ),
    'onTap': () {},
  },
};

final Map<String, Map<String, dynamic>> settingMenu2 = {
  'Help & Support': {
    'icon': Icons.question_mark_outlined,
    'title': const Text(
      'Help & Support',
    ),
    'onTap': () {},
  },
  'About': {
    'icon': Icons.warning,
    'title': const Text(
      'About',
    ),
    'onTap': () {},
  },
};