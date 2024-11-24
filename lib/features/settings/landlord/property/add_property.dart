import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

import 'set_location_screen.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController roomsController = TextEditingController();
  bool isBedChecked = false; // State for checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Property',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                controller: titleController,
                hintText: 'Property Title',
                labelText: 'Property Title',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              DescriptionInput(
                hintText: "Description here...",
                controller: descriptionController,
                maxLength: 300,
                onChanged: (value) {
                  print("Description: $value");
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: roomsController,
                hintText: '05',
                labelText: 'Rooms',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(() => SetLocationScreen());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 15,
                        color: Color(0xFF002352),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Enter The Locations',
                        style: TextStyle(
                          color: Color(0xFF002352),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Electircity Price
              MyTextField(
                controller: roomsController,
                hintText: '0.45',
                labelText: 'Electric price (\$)',
                suffix: const Text(
                  "kwh",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              // Water Price
              MyTextField(
                controller: roomsController,
                hintText: '0.25',
                labelText: 'Water price (\$)',
                suffix: const Text(
                  "m³",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              // Intenet Price
              MyTextField(
                controller: roomsController,
                hintText: '0.00',
                labelText: 'Intenet price (\$)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              // Garbage Price
              MyTextField(
                controller: roomsController,
                hintText: '0.00',
                labelText: 'Garbage price (\$)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              const Text(
                '💡You can set room\'s price at the room management.',
                style: TextStyle(
                  fontSize: 14,
                ),
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

class DescriptionInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const DescriptionInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLength = 250,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          maxLines: null,
          maxLength: maxLength,
          keyboardType: TextInputType.multiline,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            labelText: 'Descriptions',
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(
              top: 8,
              left: 12,
              right: 12,
              bottom: 30,
            ),
          ),
        ),
      ],
    );
  }
}


