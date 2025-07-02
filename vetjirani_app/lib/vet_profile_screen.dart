import 'package:flutter/material.dart';

class VetProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: Color(0xFF111714),
        elevation: 0,
        title: Text(
          'Dr. Imani Mwangi',
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
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAlOsnxSHory0iXBhALEx4fJasaHXCm2_yrgaN3y363axk_J3kq67loaxRHqx9vitrH8U9rfybxLrD3fG8W_EWpr3WRE2qFqlKwY3Mz0VpO65hqnNvnhfDNlROSgeTQJdiL38roFucZS2Nl0clQkoL2xmkhl3KV00t9Rn0uNTjkzVjGsYC7cpUbbotDUqbJnCLdeQvB9bxF1eJ4wWTaqMImO6-2stmYVxM7QJuO8ZgupIvFfP0peXmItKiwpdEeWNpfC6kMK05Z8fY',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Dr. Imani Mwangi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              'Veterinarian',
              style: TextStyle(
                color: Color(0xFFA2B4A9),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              '10 years of experience',
              style: TextStyle(
                color: Color(0xFFA2B4A9),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Specialties',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015,
                ),
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SpecialtyChip(label: 'Livestock'),
                SpecialtyChip(label: 'Poultry'),
                SpecialtyChip(label: 'Small Animals'),
              ],
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Availability',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015,
                ),
              ),
            ),
            SizedBox(height: 12),
            AvailabilityCalendar(),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
                );
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

class SpecialtyChip extends StatelessWidget {
  final String label;

  const SpecialtyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Color(0xFF29382F),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }
}

class AvailabilityCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for calendar UI
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF29382F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.white),
                onPressed: () {
                  // TODO: Previous month
                },
              ),
              Text(
                'July 2024',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {
                  // TODO: Next month
                },
              ),
            ],
          ),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(30, (index) {
              int day = index + 1;
              bool isSelected = day == 5; // Example selected day
              return TextButton(
                onPressed: () {
                  // TODO: Select day
                },
                style: TextButton.styleFrom(
                  backgroundColor: isSelected ? Color(0xFF38E078) : Colors.transparent,
                  shape: CircleBorder(),
                ),
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: isSelected ? Color(0xFF111714) : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
