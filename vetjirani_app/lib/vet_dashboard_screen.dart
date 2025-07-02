import 'package:flutter/material.dart';
import 'appointment_requests_screen.dart';

class VetDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121714),
      appBar: AppBar(
        backgroundColor: Color(0xFF121714),
        elevation: 0,
        title: Text(
          'VetJirani',
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Availability',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Color(0xFFA2B4A9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: true,
                  activeColor: Color(0xFF94E0B1),
                  onChanged: (bool value) {
                    // TODO: Implement availability toggle
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Today's Requests",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentRequestsScreen()),
                );
              },
              child: RequestCard(
                title: 'Cow with fever',
                time: '10:00 AM - 11:00 AM',
              ),
            ),
            SizedBox(height: 12),
            RequestCard(
              title: 'Goat vaccination',
              time: '11:30 AM - 12:30 PM',
            ),
            SizedBox(height: 12),
            RequestCard(
              title: 'Sheep with cough',
              time: '2:00 PM - 3:00 PM',
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String title;
  final String time;

  const RequestCard({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF121714),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                time,
                style: TextStyle(color: Color(0xFFA2B4A9), fontSize: 14),
              ),
            ],
          ),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}
