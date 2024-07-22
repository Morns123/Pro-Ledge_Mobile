import '../colorExtension.dart';
import '../model/menuModel.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
  }

  void _onTileTap(String key, BuildContext context) {
    setState(() {
      if (_selectedItem == key) {
        _selectedItem = null;
      } else {
        _selectedItem = key;
      }
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      if (menuItems[key]?['onTap'] != null) {
        menuItems[key]!['onTap'](context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              TColor.third,
              TColor.fifth,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      'Mordzz',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '@Mordzz',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: menuItems.entries.map((e) {
                      bool isSelected = _selectedItem == e.key;
                      return Stack(
                        children: [
                          AnimatedPositioned(
                            height: 45,
                            width: isSelected ? 200 : 0,
                            curve: Curves.fastOutSlowIn,
                            left: 0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              decoration: BoxDecoration(
                                color: TColor.fifth,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () => _onTileTap(e.key, context),
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'images/logo.png',
                  color: Colors.white,
                  width: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
