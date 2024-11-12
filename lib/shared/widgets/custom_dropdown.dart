import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final String hintText;
  final ValueChanged<String?> onChanged;

  const MyDropdown({
    super.key,
    required this.labelText,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        fillColor: Colors.white38,
        filled: true,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF002352)),
      dropdownColor: Colors.white,
      style: const TextStyle(color: Colors.black),
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
        widget.onChanged(newValue);
      },
    );
  }
}
