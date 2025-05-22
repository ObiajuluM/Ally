import 'package:ally/pages/actions/actions.dart';
import 'package:ally/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: i may have to move the eemergency sharing and call 199 buttons down so they are easily accessed on one tap, ask AI

//  add ally ai button somewhere
// IconButton(
//             onPressed: () {
//               print("ally ai");
//             },
//             icon: Icon(
//               Icons.shield,
//               color: Colors.green,
//             ),
//           ),

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          ///

          IconButton(
            onPressed: () {
              print("notifications");
            },
            icon: Icon(
              Icons.notifications_none_rounded,
            ),
          ),
        ],
      ),

      ///
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(themeModeProvider.notifier).changeTheme();
              },
              child: const Text(
                'Get help fast',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildEmergencyButton(
              context,
              icon: Icons.share,
              label: 'Emergency Sharing',
              onPressed: () {
                // Handle emergency sharing
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActionsPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            _buildEmergencyButton(
              context,
              icon: Icons.phone,
              label: 'Call 199',
              onPressed: () {
                // Handle emergency call
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'Be prepared',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // for (int i = 0; i < 10; i++)
            _buildCheckboxTile(
              label: 'Safety Check',
              value: true,
              onChanged: (bool? value) {
                // Handle checkbox change
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      onLongPress: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxTile({
    required String label,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
