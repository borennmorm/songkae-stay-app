import 'package:flutter/material.dart';

class StatusDropdown extends StatefulWidget {
  final List<String> prices;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const StatusDropdown({
    super.key,
    required this.prices,
    this.initialValue,
    this.onChanged,
  });

  @override
  _StatusDropdownState createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  String? selectedPrice;

  @override
  void initState() {
    super.initState();
    selectedPrice = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF002352).withOpacity(0.5),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: selectedPrice,
        hint: const Text(
          "Room Status",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF002352),
          ),
        ),
        items: widget.prices
            .map((roomStatus) => DropdownMenuItem(
                  value: roomStatus,
                  child: Text('Status'),
                ))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            selectedPrice = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Color(0xFF002352),
        ),
        style: const TextStyle(color: Colors.black, fontSize: 14),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
        underline: const SizedBox(),
      ),
    );
  }
}
