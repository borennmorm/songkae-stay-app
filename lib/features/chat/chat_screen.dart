import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Iconsax.arrow_left_2),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ryan Romb",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Text("Online",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12))
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.call,
                        )),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isMe = index % 2 == 0;
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: isMe
                          ? const EdgeInsets.only(left: 50, right: 10, top: 20)
                          : const EdgeInsets.only(right: 50, left: 10, top: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: const Border.fromBorderSide(
                            BorderSide(color: Colors.grey, width: 0.5)),
                        color: isMe
                            ? const Color.fromARGB(190, 13, 9, 65)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(
                            color: isMe ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    const Border.fromBorderSide(BorderSide(color: Colors.grey)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: "Write your message...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Iconsax.send1,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
