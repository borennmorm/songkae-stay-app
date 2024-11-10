// lib/message_screen.dart
import 'package:flutter/material.dart';
import 'package:room_rental_app/shared/widgets/custom_search_chat.dart';

import '../../shared/widgets/custom_chat_list_item.dart';
import '../../shared/widgets/custom_messages_button.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const AllMessagesButton(),
            const SizedBox(height: 10),
            const SearchBarChat(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ChatListItem(
                    name: "Person $index",
                    text: "Message preview $index",
                    time: "${index + 5} min ago",
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
