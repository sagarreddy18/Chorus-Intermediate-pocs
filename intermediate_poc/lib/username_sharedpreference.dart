import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => UsernamePageState();
}

class UsernamePageState extends State<UsernamePage> {
  TextEditingController controller = TextEditingController();
  String _savedUsername = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  // Load the username from SharedPreferences
  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUsername = prefs.getString('username') ?? '';
    });
  }

  // Save the username to SharedPreferences
  void _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    setState(() {
      _savedUsername = username;
    });
  }

  void _removeUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      _savedUsername = prefs.getString('username').toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences - Username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (_savedUsername.isNotEmpty)
              Text('Welcome back, $_savedUsername!', style: TextStyle(fontSize: 18)),
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Enter your username'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveUsername(controller.text);
                controller.clear();
              },
              child: Text('Save Username'),
            ),
            ElevatedButton(onPressed: (){
              _removeUsername();
              setState(() {
              });
            },
                child: Text("Remove User")
            )
          ],
        ),
      ),
    );
  }
}