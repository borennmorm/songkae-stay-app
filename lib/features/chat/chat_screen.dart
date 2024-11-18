// lib/message_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/shared/widgets/chat_card.dart';
import 'package:room_rental_app/shared/widgets/custom_search_chat.dart';

import 'message_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;
  bool isDarkMode = false;

  // Switch between pages based on selected index
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Toggle between light and dark theme
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SearchButton(
          onPressed: () {
            print('Search button pressed');
          },
        ),
      ),
      body: Column(
        children: [
          // Custom Tab Buttons (Recent Message and Active)
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Row(
              children: [
                FillOutlineButton(
                  press: () => _onTabSelected(0),
                  text: "Recent Messages",
                  isFilled: _selectedIndex == 0,
                ),
                const SizedBox(width: 10),
                FillOutlineButton(
                  press: () => _onTabSelected(1),
                  text: "Active",
                  isFilled: _selectedIndex == 1,
                ),
              ],
            ),
          ),
          // Display selected content based on the selected tab
          Expanded(
            child: _selectedIndex == 0
                ? ListView.builder(
                    itemCount: chatsData.length,
                    itemBuilder: (context, index) => ChatCard(
                      chat: chatsData[index],
                      press: () {
                        Get.to(() => const MessagesScreen());
                      },
                    ),
                  )
                : ListView.builder(
                    itemCount: chatsData
                        .where((chat) => chat.isActive)
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      var activeChats =
                          chatsData.where((chat) => chat.isActive).toList();
                      return ChatCard(
                        chat: activeChats[index],
                        press: () {},
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    super.key,
    this.isFilled = true,
    required this.press,
    required this.text,
  });

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      color: const Color(0xFF002352).withOpacity(0.2),
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF002352),
          fontSize: 12,
        ),
      ),
    );
  }
}
