import 'package:flutter/material.dart';
import 'home_dashboard_screen.dart';
import 'firebase_service.dart';

class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _medicalIdController = TextEditingController();

  bool _isVet = false;
  bool _isLoading = false;
  String? _errorMessage;

  void _signUp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      if (_isVet) {
        // Call Cloud Function to verify Medical ID
        final result = await FirebaseService.verifyVetMedicalId(_medicalIdController.text.trim());
        if (result != true) {
          setState(() {
            _errorMessage = 'Invalid Medical ID Code';
            _isLoading = false;
          });
          return;
        }
      }
      final user = await FirebaseService.signUpWithEmail(
          _emailController.text.trim(), _passwordController.text.trim());
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeDashboardScreen()));
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final user = await FirebaseService.signInWithEmail(
          _emailController.text.trim(), _passwordController.text.trim());
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeDashboardScreen()));
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF122118),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCeF83hIVIM4x4HguR0qV4GPgYE1AyizZRrq2EHNx09IJDEDjuggMWGOmkS4Stz-r-vuuYkUZeIYjBr1O2wIpsOYo0Lyay4wgSJWM5-ScUyFoJUN9ptTY65hwugxBuCs6msWFyJwsaemSKRTjqZ4ODdiDp9pxy2dy8aSMdO-291TfnXGD5Oly7crDJrIsf0puWFtHc5XMsIlk4uSsnnbieN5Z3k3RN4K9VaTIkw4WH4nG4A4k0SCk4KmZhimL3uT8n6ZEKYTleUgVM',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Color(0xFF96C5A8)),
                  filled: true,
                  fillColor: Color(0xFF1B3124),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF366347)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF366347)),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Color(0xFF96C5A8)),
                  filled: true,
                  fillColor: Color(0xFF1B3124),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF366347)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF366347)),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _isVet,
                    onChanged: (value) {
                      setState(() {
                        _isVet = value ?? false;
                      });
                    },
                    activeColor: Color(0xFF39E079),
                  ),
                  Text(
                    'I am a Vet',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              if (_isVet)
                TextField(
                  controller: _medicalIdController,
                  decoration: InputDecoration(
                    hintText: 'Medical ID Code',
                    hintStyle: TextStyle(color: Color(0xFF96C5A8)),
                    filled: true,
                    fillColor: Color(0xFF1B3124),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF366347)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF366347)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              SizedBox(height: 24),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 12),
              _isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: _signIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF39E079),
                            minimumSize: Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF122118),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF39E079),
                            minimumSize: Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF122118),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
