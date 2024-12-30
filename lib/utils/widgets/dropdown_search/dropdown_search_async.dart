import 'package:flutter/material.dart';

class DropdownSearchAsync extends StatefulWidget {
  const DropdownSearchAsync({Key? key}) : super(key: key);

  @override
  State<DropdownSearchAsync> createState() => _DropdownSearchAsyncState();
}

class _DropdownSearchAsyncState extends State<DropdownSearchAsync> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: "hintText",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        child: Text(
          "value",
          style: TextStyle(
            color: "value" == null ? Colors.grey : Colors.black,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              children: [Text("asd"), Text("asdasdasasd")],
            );
          },
        );
      },
    );
  }
}
