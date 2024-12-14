import 'package:flutter/material.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get Location',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFFF5F6F8),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF002352).withOpacity(0.3),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color(0xFFF5F6F8),
            child: const SearchBar(),
          ),
          // Map with Button Overlay
          Expanded(
            child: Stack(
              children: [
                // Map Placeholder
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text(
                      "Map or Location UI Here",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                // Submit Button Overlay
                Positioned(
                  bottom: 30,
                  left: 15,
                  right: 15,
                  child: FullWidthButton(
                    onPressed: () {
                      // Handle Submit Action
                    },
                    text: 'Submit',
                    color: const Color(0xFF002352),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
    );
  }
}
