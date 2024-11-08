import 'package:flutter/material.dart';

class SearchBars extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final Function(String) onTextChanged;

  const SearchBars({
    Key? key,
    required this.controller,
    required this.onSearch,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search Location',
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: onTextChanged,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.blueAccent),
            onPressed: () => onSearch(controller.text),
          ),
        ],
      ),
    );
  }
}
