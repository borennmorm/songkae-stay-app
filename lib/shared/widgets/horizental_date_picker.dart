import 'package:flutter/material.dart';

class HorizontalMonthYearPicker extends StatefulWidget {
  final DateTime initialDate; // Initial selected date
  final Function(DateTime) onDateChanged; // Callback for date selection

  const HorizontalMonthYearPicker({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  _HorizontalMonthYearPickerState createState() =>
      _HorizontalMonthYearPickerState();
}

class _HorizontalMonthYearPickerState extends State<HorizontalMonthYearPicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  // List of months
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  // Generate a list of years
  List<int> _generateYears({int start = 2020, int end = 2030}) {
    return List.generate(end - start + 1, (index) => start + index);
  }

  void _changeMonth(int offset) {
    setState(() {
      int newMonth = _selectedDate.month + offset;
      int newYear = _selectedDate.year;

      if (newMonth > 12) {
        newMonth = 1;
        newYear++;
      } else if (newMonth < 1) {
        newMonth = 12;
        newYear--;
      }

      _selectedDate = DateTime(newYear, newMonth);
      widget.onDateChanged(_selectedDate); // Trigger callback
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Button
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_left, color: Colors.black, size: 24),
            onPressed: () => _changeMonth(-1),
          ),
        ),
        const SizedBox(width: 10),

        // Month Dropdown
        DropdownButton<String>(
          value: _months[_selectedDate.month - 1],
          items: _months.map((String month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Text(month, style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
          onChanged: (String? newMonth) {
            if (newMonth != null) {
              setState(() {
                // Update the selected month
                int monthIndex = _months.indexOf(newMonth) + 1;
                _selectedDate = DateTime(
                  _selectedDate.year,
                  monthIndex,
                );
                widget.onDateChanged(_selectedDate); // Trigger callback
              });
            }
          },
          underline: const SizedBox(), // Removes the underline
        ),
        const SizedBox(width: 10),

// Year Dropdown
        DropdownButton<int>(
          value: _selectedDate.year,
          items: _generateYears().map((int year) {
            return DropdownMenuItem<int>(
              value: year,
              child:
                  Text(year.toString(), style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
          onChanged: (int? newYear) {
            if (newYear != null) {
              setState(() {
                // Update the selected year
                _selectedDate = DateTime(
                  newYear,
                  _selectedDate.month,
                );
                widget.onDateChanged(_selectedDate); // Trigger callback
              });
            }
          },
          underline: const SizedBox(), // Removes the underline
        ),

        const SizedBox(width: 10),

        // Right Button
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_right, size: 24),
            onPressed: () => _changeMonth(1),
          ),
        ),
      ],
    );
  }
}
