import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/l10n/app_localizations.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/screen/view/screen_tile.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';
import '../../../../utils/list_status.dart';

class ScreenListPage extends StatelessWidget {
  const ScreenListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.screenSettingsPageTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) =>
            ScreenListCubit(screenManager: context.read<ScreenManager>())
              ..fetchList(),
        child: const ScreenListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) =>
                  ScreenAddPage(screenManager: context.read<ScreenManager>()),
            ),
          );
        },
        tooltip: "Neues Gerät Hinzufügen",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ScreenListView extends StatelessWidget {
  const ScreenListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScreenListCubit>().state;
    switch (state.status) {
      case ListStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case ListStatus.failure:
        return const Center(child: Text("Ups da ist ein fehler aufgetreten"));
      case ListStatus.success:
        return ScreensView(screens: state.screens);
    }
  }
}

class ScreensView extends StatelessWidget {
  final List<Screen> screens;

  const ScreensView({Key? key, required this.screens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screens.isEmpty
        ? const Center(child: Text("Es konnten keine screens gefunden werden"))
        : ReorderableListView.builder(
            itemCount: screens.length,
            itemBuilder: (BuildContext c, int index) => Dismissible(
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: const Icon(Icons.delete_forever),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: const Icon(Icons.delete_forever),
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (d) => {
                context.read<ScreenManager>().removeScreen(screens[index]),
              },
              key: ValueKey(screens[index]),
              child: ScreenListTile(
                screen: screens[index],
                screenManager: context.read<ScreenManager>(),
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              context.read<ScreenManager>().reorderScreen(
                oldIndex: oldIndex,
                newIndex: newIndex,
              );
            },
          );
  }
}

class ScreenAddPage extends StatefulWidget {
  final ScreenManager screenManager;

  const ScreenAddPage({Key? key, required this.screenManager})
    : super(key: key);

  @override
  State<ScreenAddPage> createState() => _ScreenAddPageState();
}

class _ScreenAddPageState extends State<ScreenAddPage> {
  TextEditingController nameController = TextEditingController();

  IconWrapper? currentIconWrapper = const IconWrapper(
    iconDataType: IconDataType.flutterIcons,
    iconData: Icons.home,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.screenAddPageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.save),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: IconPickerTemplate(
                onChange: (IconWrapper? iconWrapper) {
                  currentIconWrapper = iconWrapper;
                },
                selected:
                    currentIconWrapper ??
                    const IconWrapper(
                      iconDataType: IconDataType.flutterIcons,
                      iconData: Icons.home,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void save() {
    String name = nameController.text;

    widget.screenManager.addScreen(
      Screen(
        id: widget.screenManager.manager.getRandString(12),
        name: name,
        iconWrapper:
            currentIconWrapper ??
            const IconWrapper(
              iconDataType: IconDataType.flutterIcons,
              iconData: Icons.home,
            ),
        index: 1,
        widgetTemplates: [],
        enabled: true,
      ),
    );
    Navigator.pop(context);
  }
}
