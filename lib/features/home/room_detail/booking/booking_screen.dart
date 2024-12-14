import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

/// Screen for booking a room with calendar selection
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Calendar state
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  /// Custom app bar with back button
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF5F6F8),
      elevation: 0,
      leading: _BackButton(),
    );
  }

  /// Main body content with calendar and booking button
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  _buildHeader(),
                  const SizedBox(height: 10),
                  _buildCalendarCard(),
                ],
              ),
            ),
          ),
          _buildBookButton(),
          const SizedBox(height: 30), // Safe area padding
        ],
      ),
    );
  }

  /// Header section with icon and text
  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Icon(
                Iconsax.calendar,
                size: 20,
                color: Color(0xFF002352),
              ),
            ),
            SizedBox(width: 5),
            Text(
              "Check in Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002352),
              ),
            ),
          ],
        ),
        Text(
          "Choose your date for move in day.",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  /// Calendar widget wrapped in a card
  Widget _buildCalendarCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: _buildCalendar(),
    );
  }

  /// Calendar widget with custom styling
  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.now(), // Can't select past dates
      lastDay: DateTime.now().add(const Duration(days: 365)), // One year ahead
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: _onDaySelected,
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: Color(0xFF002352),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        todayDecoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronIcon: Icon(Iconsax.arrow_left_2),
        rightChevronIcon: Icon(Iconsax.arrow_right_3),
      ),
    );
  }

  /// Book now button at the bottom
  Widget _buildBookButton() {
    return FullWidthButton(
      onPressed: _handleBooking,
      text: 'Book',
      color: const Color(0xFF002352),
    );
  }

  /// Handle day selection in calendar
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  /// Handle booking action
  void _handleBooking() {
    if (_selectedDay == null) {
      Get.snackbar(
        'Select Date',
        'Please select a move-in date',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    // TODO: Implement booking logic
    print('Booking for: ${_selectedDay.toString()}');
  }
}

/// Custom back button widget
class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
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
    );
  }
}



