import 'package:flutter/material.dart';
import 'userLogin.dart';
import 'z_settingsPassword.dart'; // Import the z_settingsPassword.dart file
import 'z_settingsAdd.dart'; // Import the new z_settingsAdd.dart file
import 'z_settingsRegister.dart'; // Import the new z_settingsRegister.dart file
import 'z_settingsT&C.dart'; // Import the z_settingsT&C.dart file
import 'z_settingsP&P.dart'; // Import the z_settingsP&P.dart file

class z_Settings extends StatelessWidget {
  const z_Settings({super.key});

  final Color ilocateRed = const Color(0xFFC70000);

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: ilocateRed,
        ),
      ),
    );
  }

  Widget buildItem({
    required String label,
    required IconData icon,
    required BuildContext context,
    bool isItalic = false,
    bool isBold = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      splashColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.1),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget buildItemWithValue({
    required String label,
    required String value,
    required IconData icon,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  // Function to show a secure dialog for password
  void _showPasswordInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ilocateRed,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.lock, color: ilocateRed, size: 48),
                      const SizedBox(height: 16.0),
                      Text(
                        'Password Security',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: ilocateRed,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      const Text(
                        'For your security, we do not show your password. Please do not share it with anyone.',
                        style: TextStyle(fontSize: 14.0),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            foregroundColor: ilocateRed,
                          ),
                          child: const Text('CLOSE'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show a confirmation dialog for logout
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 4,
                    color: ilocateRed,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: ilocateRed,
                              size: 32,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'LOGOUT CONFIRMATION',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: ilocateRed,
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black26),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Are you sure you want to log out?',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              style: OutlinedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                side: BorderSide(color: ilocateRed),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text(
                                'NO',
                                style: TextStyle(color: ilocateRed),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const UserLogin()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                backgroundColor: ilocateRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                'YES',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90.0,
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: ilocateRed,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                buildSectionTitle('Account Information'),
                buildItemWithValue(
                  label: 'Phone number',
                  value: '+63928******23',
                  icon: Icons.phone,
                  context: context,
                ),
                buildItemWithValue(
                  label: 'Email',
                  value: 'ma****23@gmail.com',
                  icon: Icons.email,
                  context: context,
                ),
                buildItem(
                  label: 'Password',
                  icon: Icons.lock,
                  isBold: true,
                  onTap: () {
                    _showPasswordInfoDialog(context);
                  },
                  context: context,
                ),
                buildItem(
                  label: 'Forgot Password',
                  icon: Icons.lock_reset,
                  isBold: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPassword()),
                    );
                  },
                  context: context,
                ),
                buildItem(
                  label: 'Add Admin',
                  icon: Icons.person_add,
                  isBold: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const z_settingsAdd()),
                    );
                  },
                  context: context,
                ),
                buildItem(
                  label: 'Register Device',
                  icon: Icons.devices,
                  isBold: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const z_settingsRegister()),
                    );
                  },
                  context: context,
                ),

                const Divider(height: 32.0),

                buildSectionTitle('About'),
                buildItem(
                  label: 'Terms & Condition of Use',
                  icon: Icons.description,
                  isBold: true,
                  isItalic: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TermsAndConditions()),
                    );
                  },
                  context: context,
                ),
                buildItem(
                  label: 'Privacy Policy',
                  icon: Icons.privacy_tip,
                  isBold: true,
                  isItalic: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                    );
                  },
                  context: context,
                ),

                const Divider(height: 32.0),

                buildSectionTitle('Login'),
                buildItem(
                  label: 'Log out',
                  icon: Icons.logout,
                  isBold: true,
                  isItalic: true,
                  onTap: () {
                    _showLogoutConfirmationDialog(context);
                  },
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
