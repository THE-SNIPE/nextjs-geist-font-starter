import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: Color(0xFF111714),
        elevation: 0,
        title: Text(
          'Book Appointment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Service',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ServiceChip(label: 'General Checkup'),
                ServiceChip(label: 'Vaccination'),
                ServiceChip(label: 'Emergency Care'),
                ServiceChip(label: 'Surgery'),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Select Date',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            SizedBox(height: 12),
            DateSelector(),
            SizedBox(height: 24),
            Text(
              'Select Time',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            SizedBox(height: 12),
            TimeSelector(),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement booking confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF38E078),
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  color: Color(0xFF111714),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceChip extends StatelessWidget {
  final String label;

  const ServiceChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      selectedColor: Color(0xFF38E078),
      backgroundColor: Color(0xFF3D5245),
      onSelected: (bool selected) {
        // TODO: Handle service selection
      },
    );
  }
}

class DateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for date selector UI
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF29382F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Date Picker Placeholder',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for time selector UI
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF29382F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Time Slots Placeholder',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF29382F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'AM/PM Placeholder',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
