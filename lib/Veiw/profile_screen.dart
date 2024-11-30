import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://tse3.mm.bing.net/th?id=OIP.Ov9mSHs_sOY50781aDZtJQHaNK&pid=Api&P=0&h=220',
              ),
            ),
            const SizedBox(height: 16),
            // User Name
            const Text(
              'Pooja',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Email
            const Text(
              'Pooja Dudi@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Action Buttons
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.lightGreen),
              title: const Text('Edit Profile'),
              onTap: () {
                // Handle edit profile
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Profile Tapped')),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.lightGreen),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings Tapped')),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout Tapped')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
