import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../settings/screen_setting/screen_list/view/screen_list_page.dart';
import '../screen.dart';

class ScreenListTile extends StatelessWidget {
  final Screen screen;
  ScreenListTile({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(screen.name),
      leading: Icon(Icons.stream),
      title: Text(screen.name),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenEditPage(screen: screen,)))},

    );
  }
}

