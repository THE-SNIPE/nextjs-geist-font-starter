import 'package:flutter/material.dart';
import 'role_selection_screen.dart';

void main() {
  runApp(VetJiraniApp());
}

class VetJiraniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetJirani',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF39E079),
        scaffoldBackgroundColor: Color(0xFF122118),
        fontFamily: 'Plus Jakarta Sans',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF122118),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VetJirani',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -0.015,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Connecting Farmers & Vets Seamlessly',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCfYx5Fh5XCJ7qTCtzKohPsO8B0_I0v3NUtCM94taufNEIge6Z9EA2TKMA400Cj755XoLARbGnr2snbOPvsdXLxp-08XCICfnHgqStowUiv4PMvSsO6oIot5I1EIQJdFlDTXrrAWLrm5nn8UjDejULccfAAiUcJlYxOpej6sK-LWFE1vQZmgJ8M91I8gd8SMlpBg3VkV-zzQQma1C8T5GjGQA6UTQR0lHxHr-6JqUbz1lW-Fps8_mp_DxPkwAZa4NoMNSMu09r6jfs',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
          );
        },
        backgroundColor: Color(0xFF39E079),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
