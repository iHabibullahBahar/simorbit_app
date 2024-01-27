import 'package:flutter/material.dart';
import 'package:simorbit_app/src/consts/colors.dart';
import 'package:simorbit_app/src/screens/calls/call_screen.dart';
import 'package:simorbit_app/src/screens/messages/message_screen.dart';
import 'package:simorbit_app/src/screens/settings/setting_screen.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _selectedIndex = 0;

  ///Navigation bar active icons path
  List<IconData> selectedIcons = [
    Icons.message_rounded,
    Icons.call_rounded,
    Icons.settings_rounded,
  ];

  ///Navigation bar inactive icons path
  List<IconData> unselectedIcons = [
    Icons.message_outlined,
    Icons.call_outlined,
    Icons.settings_outlined,
  ];

  ///Navigation bar labels
  List<String> selectedLabels = [
    'Messages',
    'Calls',
    'Settings',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          MessageScreen(),
          CallScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color:
                Colors.transparent, // Set the background color to transparent
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: zGraySwatch[100]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              selectedLabels.length,
              (index) => InkWell(
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: SizedBox(
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _selectedIndex == index
                            ? selectedIcons[index]
                            : unselectedIcons[index],
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          selectedLabels[index],
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? zGraySwatch[900]
                                : zGraySwatch[500],
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
