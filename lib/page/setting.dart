import 'package:flutter/material.dart';

import '../colorExtension.dart';
import '../components/bottomNavigationBar.dart';
import '../model/settingModel.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? _selectedItem;
  String? _selectedItem2;

  void _onTileTap(String key, bool isFirstMenu) {
    setState(() {
      if (isFirstMenu) {
        _selectedItem = key;
        settingMenu[key]!['onTap']();
      } else {
        _selectedItem2 = key;
        settingMenu2[key]!['onTap']();
      }
    });
  }

  Widget buildMenuColumn(Map<String, Map<String, dynamic>> menu,
      String? selectedItem, bool isFirstMenu) {
    return Column(
      children: menu.entries.map((e) {
        bool isSelected = selectedItem == e.key;
        return Stack(
          children: [
            AnimatedPositioned(
              height: 45,
              width: isSelected ? MediaQuery.sizeOf(context).width : 0,
              curve: Curves.fastOutSlowIn,
              left: 10,
              duration: const Duration(milliseconds: 300),
              child: Container(
                decoration: BoxDecoration(
                  color: TColor.eleventh,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ListTile(
              onTap: () => _onTileTap(e.key, isFirstMenu),
              leading: Icon(
                e.value['icon'],
                color: e.value['color'],
              ),
              title: Text(
                e.key,
                style: TextStyle(color: e.value['color']),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: TColor.seventh,
                width: double.infinity,
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: BackButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const BotNavBar()));
                          },
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      const Text(
                        'Account Information',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height - 220,
                color: const Color(0xffA5A5A5),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 140),
            child: Container(
              width: double.infinity,
              height: 420,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: Text(
                      'Account & Security',
                      style: TextStyle(
                        color: Color(0xffA5A5A5),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  buildMenuColumn(settingMenu, _selectedItem, true),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: Text(
                      'Info & Help',
                      style: TextStyle(
                        color: Color(0xffA5A5A5),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  buildMenuColumn(settingMenu2, _selectedItem2, false),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 590),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                minimumSize:
                    MaterialStatePropertyAll(Size(double.infinity, 60)),
              ),
              onPressed: () {},
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xffE20000),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
