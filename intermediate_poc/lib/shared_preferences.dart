import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
   LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _loadLoginStatus();
  }

  // Load login status from SharedPreferences
  void _loadLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  // Save login status to SharedPreferences
  void _updateLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
    setState(() {
      _isLoggedIn = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Demo'),
      ),
      body: Center(
        child: _isLoggedIn
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You are logged in!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _updateLoginStatus(false),
              child: Text('Logout'),
            ),
          ],
        )
            : ElevatedButton(
          onPressed: () => _updateLoginStatus(true),
          child: Text('Login'),
        ),
      ),
    );
  }
}