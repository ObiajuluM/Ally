import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: [
          _buildSectionHeader(context, 'Emergency info'),
          _InfoTile(
            icon: Icons.info_outline,
            text: 'My Information',
            onTap: () {
              ///
            },
          ),
          _InfoTile(
            icon: Icons.contact_emergency_outlined,
            text: 'My Trusted Contacts',
            onTap: () {},
          ),
          _InfoTile(
            icon: Icons.visibility_outlined,
            text: 'Emergency info access',
            onTap: () {},
          ),
          const SizedBox(height: 30), // Spacing between sections

          _buildSectionHeader(context, 'Your videos'),
          _VideoPlaceholderTile(
            text: 'No emergency videos',
            onTap: () {},
          ),
          const SizedBox(height: 30), // Spacing between sections

          _buildSectionHeader(context, 'Help & support'),
          _InfoTile(
            icon: Icons.lightbulb_outline,
            text: 'Demos',
            onTap: () {},
          ),
          _InfoTile(
            icon: Icons.help_outline,
            text: 'Help',
            onTap: () {},
          ),
          _InfoTile(
            icon: Icons.feedback_outlined,
            text: 'Send feedback',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Helper method to build section headers

  // TODO: use everywhere
  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[400], // Lighter grey for headers
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Custom ListTile for the information rows
class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _InfoTile({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        // Provides the ripple effect on tap
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.green[400],
                size: 24,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                // color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom ListTile for the 'No emergency videos' row
class _VideoPlaceholderTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _VideoPlaceholderTile({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        // Provides the ripple effect on tap
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            children: [
              // No icon on the left for this specific tile
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey[600]), // Lighter text
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
