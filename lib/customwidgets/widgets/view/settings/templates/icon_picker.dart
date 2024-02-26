import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../utils/icon_picker_map.dart';

class IconPickerTemplate extends StatefulWidget {
  final Function(IconData? iconData) onChange;
  final IconData selected;
  final bool reset;
  const IconPickerTemplate(
      {Key? key,
      required this.onChange,
      this.selected = Icons.home,
      this.reset = false})
      : super(key: key);

  @override
  State<IconPickerTemplate> createState() => _IconPickerTemplateState();
}

class _IconPickerTemplateState extends State<IconPickerTemplate> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: "Icon",
        ),
      ),
      onChanged: (s) => widget.onChange(icons[s]),
      items: icons.keys.toList()..sort(),
      selectedItem: icons.keys.firstWhere(
          (element) => icons[element]?.codePoint == widget.selected.codePoint,
          orElse: () => "home"),
      dropdownBuilder: (context, iconKey) {
        return iconKey != null ? Icon(icons[iconKey]) : const Text("");
      },
      clearButtonProps: ClearButtonProps(
        isVisible: widget.reset,
      ),
      popupProps: PopupProps.modalBottomSheet(
        modalBottomSheetProps: ModalBottomSheetProps(
            backgroundColor: Theme.of(context).colorScheme.background),
        showSelectedItems: true,
        searchDelay: const Duration(seconds: 0),
        showSearchBox: true,
        title: const Text(
          "Icon",
          style: TextStyle(fontSize: 17.5),
        ),
        itemBuilder: (context, iconKey, b) {
          return ListTile(
            title: Icon(icons[iconKey] ?? icons["home"]),
          );
        },
      ),
    );
  }
}
