import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
Map<String, IconData> icons = {
  "import export": Icons.import_export,
  "home": Icons.home,
  "home outlined": Icons.home_outlined,
  "home work": Icons.home_work,
  "light bulb": Icons.lightbulb,
  "light": Icons.light,
  "highlight rounded": Icons.highlight_rounded,
  "window": Icons.window,
  "window sharp": Icons.window_sharp,
  "stream": Icons.stream,
  "living": Icons.living,
  "living outlined": Icons.living_outlined,
  "family restroom": Icons.family_restroom,
  "checkroom outlined": Icons.checkroom_outlined,
  "bathroom": Icons.bathroom,
};
class IconPickerTemplate extends StatefulWidget {
  final Function(IconData iconData) onChange;
  final IconData selected;
  const IconPickerTemplate({Key? key, required this.onChange, this.selected = Icons.home}) : super(key: key);

  @override
  State<IconPickerTemplate> createState() => _IconPickerTemplateState();
}

class _IconPickerTemplateState extends State<IconPickerTemplate> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.BOTTOM_SHEET,
      searchDelay: const Duration(seconds: 0),
      showSearchBox: true,
      dropdownSearchDecoration: const InputDecoration(labelText: "Icon"),
      onChanged: (s) => widget.onChange(icons[s]!),
      items: icons.keys.toList(),
      selectedItem: icons.keys.firstWhere((element) => icons[element]?.codePoint == widget.selected.codePoint, orElse: () => "home"),
      dropdownBuilder: (context, iconKey) {
        return Icon(icons[iconKey] ?? Icons.bathroom,);
      },
      popupItemBuilder: (context, iconKey, b) {
        return ListTile(title: Icon(icons[iconKey] ?? Icons.bathroom),);
      },
    );
  }
}
