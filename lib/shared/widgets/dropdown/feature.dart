import 'package:flutter/material.dart';

class RoomFeatureDropdown extends StatefulWidget {
  final List<String> roomFeature; // List of room features
  final String? initialValue; // Initial selected value
  final ValueChanged<String?>? onChanged; // Callback for selection changes

  const RoomFeatureDropdown({
    super.key,
    required this.roomFeature,
    this.initialValue,
    this.onChanged,
  });

  @override
  RoomFeatureDropdownState createState() => RoomFeatureDropdownState();
}

class RoomFeatureDropdownState extends State<RoomFeatureDropdown> {
  String? selectedFeature;

  @override
  void initState() {
    super.initState();
    selectedFeature = widget.initialValue;
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
        value: selectedFeature,
        hint: const Text(
          "Feature",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF002352),
          ),
        ),
        items: widget.roomFeature
            .map((feature) => DropdownMenuItem(
                  value: feature,
                  child: Text(feature),
                ))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            selectedFeature = value;
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
