import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF87CEEB),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Profile Settings'),
              onTap: () {
                // You can implement functionality here when this tile is tapped.
              },
            ),
            ListTile(
              title: const Text('Notification Settings'),
              onTap: () {
                // You can implement functionality here when this tile is tapped.
              },
            ),
            ListTile(
              title: const Text('Privacy Settings'),
              onTap: () {
                // You can implement functionality here when this tile is tapped.
              },
            ),
          ],
        ),
      ),
    );
  }
}