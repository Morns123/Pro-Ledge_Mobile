import '../page/borrow.dart';
import '../page/return.dart';
import '../page/setting.dart';
import '../page/contactUs.dart';
import 'package:flutter/material.dart';

final Map<String, Map<String, dynamic>> menuItems = {
  'Settings': {
    'icon': Icons.settings_outlined,
    'color': Colors.white,
    'onTap': (BuildContext context) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const SettingPage()));
    },
  },
  'Borrowing': {
    'icon': Icons.bookmark_add_outlined,
    'color': Colors.white,
    'onTap': (BuildContext context) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const BorrowPage()));
    },
  },
  'Returning': {
    'icon': Icons.bookmark_remove_outlined,
    'color': Colors.white,
    'onTap': (BuildContext context) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ReturnPage()));
    },
  },
  'Contact Us': {
    'icon': Icons.call,
    'color': Colors.white,
    'onTap': (BuildContext context) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ContactUsPage()));
    },
  },
};
