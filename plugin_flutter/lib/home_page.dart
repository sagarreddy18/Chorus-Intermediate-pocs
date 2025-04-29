import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> signOut() async{
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: ()  {
              signOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Guest',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text('You are logged in!'),
          ],
        ),
      ),
    );
  }
}
