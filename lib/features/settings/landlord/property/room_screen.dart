import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/shared/widgets/dropdown/feature.dart';
import 'package:room_rental_app/shared/widgets/dropdown/floor.dart';
import 'package:room_rental_app/shared/widgets/dropdown/price.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  // Track whether select mode is active
  bool selectMode = false;
  // Store selected room labels
  final List<String> selectedCards = [];
  // Sample room labels
  final List<String> roomLabels = ['01', '02', '03', '04', '05'];

  // Enable or disable select mode
  void toggleSelectMode(bool enabled) {
    setState(() {
      selectMode = enabled;
      if (!enabled) {
        // Clear selected cards when exiting select mode
        selectedCards.clear();
      }
    });
  }

  // Toggle selection of a card
  void toggleCardSelection(String cardLabel) {
    setState(() {
      if (selectedCards.contains(cardLabel)) {
        selectedCards.remove(cardLabel); // Remove if already selected
      } else {
        selectedCards.add(cardLabel); // Add if not selected
      }
    });
  }

  // Select or unselect all cards
  void selectAllCards(bool selectAll) {
    setState(() {
      if (selectAll) {
        selectedCards.addAll(
            roomLabels.where((label) => !selectedCards.contains(label)));
      } else {
        selectedCards.clear(); // Clear selections
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6F8),
        title: Text(
          selectMode ? 'Select Rooms' : 'Room Management',
          style: const TextStyle(fontSize: 15),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (selectMode) {
              toggleSelectMode(false); // Exit select mode
            } else {
              Navigator.pop(context); // Go back to the previous screen
            }
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
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.notification,
              size: 23,
              color: Color(0xFF002352),
            ),
            onPressed: () {
              print("hello, I'm a notification!");
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter widget (Optional, not part of the key logic)
            const Filter(),
            const SizedBox(
              height: 10,
            ),
            // Help Bar
            if (selectMode)
              Container(
                width: double.infinity,
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
                        toggleSelectMode(false); // Exit select mode
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
                            print('edit rooms: $selectedCards');
                            // Add delete functionality here
                          },
                          icon: const Icon(
                            Iconsax.edit,
                            color: Color(0xFF002352),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('Delete selected rooms: $selectedCards');
                            // Add delete functionality here
                          },
                          icon: const Icon(
                            Iconsax.trash,
                            color: Color(0xFF002352),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'All',
                          style: TextStyle(
                            color: Color(0xFF002352),
                          ),
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: const Color(0xFF002352),
                          value: selectedCards.length == roomLabels.length,
                          onChanged: (bool? value) {
                            selectAllCards(value ?? false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            // Room cards display in a GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 90,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 0,
                ),
                itemCount: roomLabels.length,
                itemBuilder: (context, index) {
                  final label = roomLabels[index];
                  final isSelected = selectedCards.contains(label);

                  return Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onLongPress: () {
                        toggleSelectMode(
                            true); // Enable select mode on long press
                      },
                      onTap: () {
                        if (selectMode) {
                          toggleCardSelection(
                              label); // Toggle card selection in select mode
                        } else {
                          print(
                              'Navigate to room details: $label'); // Navigate to another screen
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF002352).withOpacity(0.3),
                            ),
                            child: Icon(
                              isSelected
                                  ? Icons.check_circle
                                  : Icons.bed_outlined,
                              color: const Color(0xFF002352),
                            ),
                          ),
                          Positioned(
                            right: 12,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
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

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFF002352).withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(color: Color(0xFF002352)),
              ),
              PriceDropdown(
                prices: const ['All', '45', '50', '60', '75'],
                initialValue: 'All',
                onChanged: (selected) {
                  print("Selected Price: $selected");
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Floor',
                style: TextStyle(color: Color(0xFF002352)),
              ),
              FloorDropdown(
                floor: const ['All', '1', '2'],
                initialValue: 'All',
                onChanged: (selected) {
                  print("Selected floor: $selected");
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Feature',
                style: TextStyle(color: Color(0xFF002352)),
              ),
              RoomFeatureDropdown(
                roomFeature: const ['All', 'Air', 'Fan'],
                initialValue: 'All',
                onChanged: (selected) {
                  print("Selected floor: $selected");
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
