import 'package:flutter/material.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder data for analytics
    final appointmentStats = {
      'Total Appointments': 120,
      'Completed': 95,
      'Pending': 15,
      'Cancelled': 10,
    };

    final commonDiseases = [
      'Foot and Mouth Disease',
      'Mastitis',
      'Poultry Respiratory Disease',
      'Parasitic Infections',
    ];

    final treatmentOutcomes = {
      'Successful': 85,
      'Ongoing': 10,
      'Failed': 5,
    };

    return Scaffold(
      backgroundColor: Color(0xFF111714),
      appBar: AppBar(
        backgroundColor: Color(0xFF111714),
        elevation: 0,
        title: Text(
          'Analytics Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Appointment Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          SizedBox(height: 12),
          ...appointmentStats.entries.map((entry) => ListTile(
                title: Text(
                  entry.key,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  entry.value.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Divider(color: Colors.white54),
          Text(
            'Common Diseases',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          SizedBox(height: 12),
          ...commonDiseases.map((disease) => ListTile(
                title: Text(
                  disease,
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Divider(color: Colors.white54),
          Text(
            'Treatment Outcomes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          SizedBox(height: 12),
          ...treatmentOutcomes.entries.map((entry) => ListTile(
                title: Text(
                  entry.key,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  entry.value.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
