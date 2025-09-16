import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/settings/settings_view_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      child: Consumer<SettingsViewModel>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: const Color(0xffF4F6F8),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 30),
                      
                      _buildProfileSection(context),
                      const SizedBox(height: 30),
                      
                      _buildSettingsSection(
                        'Preferences',
                        [
                          _buildSettingsTile(
                            Icons.notifications_outlined,
                            'Notifications',
                            'Manage your notification preferences',
                            trailing: Switch(
                              value: provider.notificationsEnabled,
                              onChanged: provider.toggleNotifications,
                              activeColor: Colors.black,
                            ),
                          ),
                          _buildSettingsTile(
                            Icons.dark_mode_outlined,
                            'Dark Mode',
                            'Switch between light and dark theme',
                            trailing: Switch(
                              value: provider.darkModeEnabled,
                              onChanged: provider.toggleDarkMode,
                              activeColor: Colors.black,
                            ),
                          ),
                          _buildSettingsTile(
                            Icons.language_outlined,
                            'Language',
                            'English',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () => _showLanguageDialog(context, provider),
                          ),
                          _buildSettingsTile(
                            Icons.location_on_outlined,
                            'Location Services',
                            'Allow location access for better recommendations',
                            trailing: Switch(
                              value: provider.locationEnabled,
                              onChanged: provider.toggleLocation,
                              activeColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      _buildSettingsSection(
                        'Account',
                        [
                          _buildSettingsTile(
                            Icons.person_outline,
                            'Edit Profile',
                            'Update your personal information',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            Icons.security_outlined,
                            'Privacy & Security',
                            'Manage your privacy settings',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            Icons.payment_outlined,
                            'Payment Methods',
                            'Manage your payment options',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      _buildSettingsSection(
                        'Support',
                        [
                          _buildSettingsTile(
                            Icons.help_outline,
                            'Help Center',
                            'Get help and support',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            Icons.feedback_outlined,
                            'Send Feedback',
                            'Share your thoughts with us',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            Icons.info_outline,
                            'About',
                            'App version and information',
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () => _showAboutDialog(context),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      _buildLogoutButton(context),
                      
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Settings",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('me.jpg'),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Talal Rafiq',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'talal.rafiq@example.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
    IconData icon,
    String title,
    String subtitle, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () => _showLogoutDialog(context),
        style: FilledButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, SettingsViewModel provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                leading: Radio<String>(
                  value: 'English',
                  groupValue: provider.selectedLanguage,
                  onChanged: (value) {
                    provider.setLanguage(value!);
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: const Text('Urdu'),
                leading: Radio<String>(
                  value: 'Urdu',
                  groupValue: provider.selectedLanguage,
                  onChanged: (value) {
                    provider.setLanguage(value!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Travel App',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.flight_takeoff, size: 48),
      children: const [
        Text('A beautiful travel booking app built with Flutter.'),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                // Handle logout logic here
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}