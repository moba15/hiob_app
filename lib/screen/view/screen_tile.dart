import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/manager/screen_manager.dart';

import '../../settings/screen_setting/screen_list/view/screen_list_page.dart';
import '../screen.dart';

class ScreenListTile extends StatelessWidget {
  final Screen screen;
  final ScreenManager screenManager;

  ScreenListTile({Key? key, required this.screen, required this.screenManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(screen.name),
      leading: Icon(IconData(int.parse(screen.iconID, radix: 16),
          fontFamily: 'MaterialIcons')),
      title: Text(screen.name),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScreenEditPage(
                      screen: screen,
                      screenManager: screenManager,
                    )))
      },
    );
  }
}

