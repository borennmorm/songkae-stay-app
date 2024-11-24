import 'package:flutter/material.dart';

class PriceDropdown extends StatefulWidget {
  final List<String> prices;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const PriceDropdown({
    super.key,
    required this.prices,
    this.initialValue,
    this.onChanged,
  });

  @override
  _PriceDropdownState createState() => _PriceDropdownState();
}

class _PriceDropdownState extends State<PriceDropdown> {
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
        horizontal: 10,
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
          "Price",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF002352),
          ),
        ),
        items: widget.prices
            .map((price) => DropdownMenuItem(
                  value: price,
                  child: Text('$price'),
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
