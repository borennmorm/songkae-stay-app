import 'package:flutter/material.dart';

class RoleDropdown extends StatelessWidget {
  final String? selectedRole;
  final ValueChanged<String?> onChanged;

  const RoleDropdown({
    super.key,
    required this.selectedRole,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey.shade400), // Border around the entire box
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: DropdownButtonFormField<String>(
        value: selectedRole,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the default border
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintText: 'Account Type',
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
        items: const [
          DropdownMenuItem<String>(
            value: 'Tenant',
            child: Text('Tenant'),
          ),
          DropdownMenuItem<String>(
            value: 'Landlord',
            child: Text('Landlord'),
          ),
        ],
      ),
    );
  }
}
