import 'package:ally/pages/actions/actions.dart';
import 'package:ally/pages/home/components/big_red_button.dart';

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

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Quick Actions',
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
              'The Big Red Button',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            ///
            // for (int i = 0; i < 10; i++)
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 40,
              ),
              child: BigRedButton(),
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
}
