import 'package:flutter/material.dart';

class SupportHelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121714),
      appBar: AppBar(
        backgroundColor: Color(0xFF121714),
        elevation: 0,
        title: Text(
          'Support',
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          SizedBox(height: 12),
          FAQItem(
            question: 'How to book an appointment?',
            answer: 'You can search for vets and book appointments through the app.',
          ),
          FAQItem(
            question: 'How to contact support?',
            answer: 'Use the contact form below to reach out to our support team.',
          ),
          SizedBox(height: 24),
          Text(
            'Contact Support',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Your Email',
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Color(0xFF1E2520),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF404F46)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF404F46)),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Subject',
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Color(0xFF1E2520),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF404F46)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF404F46)),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 12),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Message',
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Color(0xFF1E2520),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF404F46)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF404F46)),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Submit support request
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF94E0B1),
              minimumSize: Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                color: Color(0xFF121714),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Report an Issue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
          SizedBox(height: 12),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF2B362F),
              child: Icon(Icons.flag, color: Colors.white),
            ),
            title: Text(
              'Report an issue',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // TODO: Implement report issue
            },
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            answer,
            style: TextStyle(color: Color(0xFFA2B4A9)),
          ),
        ),
      ],
    );
  }
}
