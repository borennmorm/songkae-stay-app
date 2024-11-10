// lib/widgets/search_bar.dart
import 'package:flutter/material.dart';

class SearchBarChat extends StatelessWidget {
  const SearchBarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
            hintText: 'Search message...',
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
    );
  }
}
