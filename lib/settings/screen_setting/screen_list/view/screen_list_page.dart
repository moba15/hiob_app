import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/screen/view/screen_tile.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';

class ScreenListPage extends StatelessWidget {
  const ScreenListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Settings"),

      ),
      body: BlocProvider(
        create: (_) => ScreenListCubit(screenManager: context.read<ScreenManager>())..fetchList(),
        child: ScreenListView(),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) =>  ScreenAddPage(screenManager: context.read<ScreenManager>(),)));
        },
        child: const Icon(Icons.add),
        tooltip: "Neues Gerät Hinzufügen",
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
        return const Center(child: CircularProgressIndicator(),);
      case ListStatus.failure:
        return const Center(child: Text("Ups da ist ein fehler aufgetreten"),);
      case ListStatus.success:
        return ScreensView(screens: state.screens);
    }

  }
}

class ScreensView extends StatelessWidget {
  final List<Screen> screens;
  const ScreensView({Key? key, required this.screens }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screens.isEmpty ?
        const Center(child: Text("Es konnten keine screens gefunden werden"),)
        :
        ReorderableListView.builder(
          itemCount: screens.length,
          itemBuilder: (BuildContext context, int index) => ScreenListTile(key: ValueKey(index),screen: screens[index]),
          onReorder: (oldIndex, newIndex) {

          },
        );

  }
}


class ScreenAddPage extends StatelessWidget {
  final ScreenManager screenManager;
  TextEditingController nameController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  ScreenAddPage({Key? key, required this.screenManager}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.save),
      ),
      body: ScreenAddForm(nameController: nameController, iconController: iconController, indexController: indexController,),
    );

  }



  void save() {

  }
}

class ScreenAddForm extends StatefulWidget {
  TextEditingController nameController ;
  TextEditingController iconController ;
  TextEditingController indexController;
  ScreenAddForm({Key? key, required this.nameController, required this.iconController, required this.indexController}) : super(key: key);

  @override
  State<ScreenAddForm> createState() => _ScreenAddFormState();
}

class _ScreenAddFormState extends State<ScreenAddForm> {

  Icon icon = const Icon(Icons.insert_emoticon);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              controller: widget.nameController,
              decoration: const InputDecoration(hintText: "Name"),
              keyboardType: TextInputType.text,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              onChanged: (value) {
                if(int.tryParse(value, radix: 16) != null) {
                  setState(() {
                    icon = Icon(IconData(int.parse(value, radix: 16), fontFamily: 'MaterialIcons'));
                  });
                }
              },
              controller: widget.iconController,
              decoration: InputDecoration(hintText: "IconID", suffixIcon: icon),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              controller: widget.indexController,
              decoration: const InputDecoration(hintText: "Index"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
          ),


        ],
      ),
    );
  }
}


class ScreenEditPage extends StatelessWidget {
  final Screen screen;
  const ScreenEditPage({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.save),
      ),
    );
  }
}