import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'add_property.dart';
import 'properties_detail_screen.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  bool selectMode = false;
  final List<int> selectedCards = []; // Store selected property indices

  // Toggle selection mode
  void toggleSelectMode(bool enabled) {
    setState(() {
      selectMode = enabled;
      if (!enabled) {
        selectedCards.clear(); // Clear selections when exiting select mode
      }
    });
  }

  // Toggle card selection
  void toggleCardSelection(int cardIndex) {
    setState(() {
      if (selectedCards.contains(cardIndex)) {
        selectedCards.remove(cardIndex);
      } else {
        selectedCards.add(cardIndex);
      }
    });
  }

  // Select or deselect all cards
  void selectAllCards(bool selectAll) {
    setState(() {
      if (selectAll) {
        selectedCards.clear();
        for (int i = 0; i < properties.length; i++) {
          selectedCards.add(i);
        }
      } else {
        selectedCards.clear();
      }
    });
  }

  // Sample properties data
  final List<Map<String, dynamic>> properties = List.generate(
    5, // Number of properties
    (index) => {
      "name": "Property ${index + 1}",
      "rooms": 25 + index,
      "location": "Battambang, Cambodia",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6F8),
        title: Row(
          children: [
            Text(
              selectMode ? 'Select Property' : 'Properties',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF002352).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Text(
                properties.length.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
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
              shape: BoxShape.rectangle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProperty());
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 3,
        child: const Icon(
          Iconsax.add,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            if (selectMode)
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        toggleSelectMode(false);
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Color(0xFF002352),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print('Edit selected: $selectedCards');
                          },
                          icon: const Icon(
                            Iconsax.edit,
                            color: Color(0xFF002352),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('Delete selected: $selectedCards');
                          },
                          icon: const Icon(
                            Iconsax.trash,
                            color: Color(0xFF002352),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'All',
                          style: TextStyle(color: Color(0xFF002352)),
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: const Color(0xFF002352),
                          value: selectedCards.length == properties.length,
                          onChanged: (bool? value) {
                            selectAllCards(value ?? false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: PropertyCard(
                      property: properties[index],
                      number: index + 1,
                      isSelected: selectedCards.contains(index),
                      onLongPress: () {
                        toggleSelectMode(true);
                        toggleCardSelection(index);
                      },
                      onTap: () {
                        if (selectMode) {
                          toggleCardSelection(index);
                        } else {
                          Get.to(() => PropertyDetailScreen());
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;
  final int number;
  final bool isSelected;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  const PropertyCard({
    super.key,
    required this.property,
    required this.number,
    required this.isSelected,
    required this.onLongPress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF002352).withOpacity(0.3),
                  ),
                  child: Center(
                    child: Text(
                      number.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Color(0xFF002352),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.home,
                              size: 13, color: Colors.black),
                          const SizedBox(width: 5),
                          Text(
                            'Rooms: ${property['rooms']}',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.location,
                              size: 13, color: Colors.black),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              property['location'],
                              style: const TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              right: 10,
              top: 10,
              child: Icon(
                Icons.check_circle,
                color: const Color(0xFF002352),
              ),
            ),
        ],
      ),
    );
  }
}
