import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  bool isChecked = false;
  String selectedValue = "None";

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Room',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                controller: titleController,
                hintText: '50',
                labelText: 'Room Price (\$)',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: titleController,
                hintText: '1',
                labelText: 'Floor',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: titleController,
                hintText: '4 x 5',
                labelText: 'Room Size',
                suffix: Text('m²'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              const Text('Select Tenent'),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    isExpanded: true,
                    icon: const Icon(Iconsax.arrow_down_1,
                        color: Color(0xFF002352)),
                    items: const [
                      DropdownMenuItem(
                        value: "None",
                        child: Text("None"),
                      ),
                      DropdownMenuItem(
                        value: "John",
                        child: Text("John"),
                      ),
                      DropdownMenuItem(
                        value: "Dara",
                        child: Text("Dara"),
                      ),
                      DropdownMenuItem(
                        value: "Sovann",
                        child: Text("Sovann"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCheckbox(
                    value: isChecked,
                    label: "Bed",
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue ?? false;
                      });
                    },
                  ),
                  CustomCheckbox(
                    value: isChecked,
                    label: "Bathroom",
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue ?? false;
                      });
                    },
                  ),
                  CustomCheckbox(
                    value: isChecked,
                    label: "Parking",
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FullWidthButton(
                onPressed: () {},
                text: 'Create',
                color: const Color(0xFF002352),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffix; // New suffix parameter
  final TextInputType keyboardType;
  final bool obscureText; // Controls whether the text should be hidden

  const MyTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.suffix,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, // Default to false
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure, // Uses the updated obscureText logic
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          borderSide: BorderSide.none, // No border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        suffix: widget.suffix, // Center-right aligned widget
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;
  final Color checkColor;
  final Color activeColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.checkColor = Colors.white,
    this.activeColor = const Color(0xFF002352),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: value,
            checkColor: checkColor,
            activeColor: activeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
