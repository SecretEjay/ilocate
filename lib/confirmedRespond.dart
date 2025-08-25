import 'package:flutter/material.dart';
import 'markResolved.dart';
import 'alertModel.dart'; // Import the new Alert class from alertModel.dart

class ConfirmedRespond extends StatelessWidget {
  final String incidentId;

  const ConfirmedRespond({super.key, required this.incidentId});

  final Color ilocateRed = const Color(0xFFC70000);
  final Color linkBlue = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          automaticallyImplyLeading: false, // This removes the back button
          backgroundColor: ilocateRed,
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.only(left: 96.0, bottom: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'RESPOND',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      'CONFIRMED',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Updated icon to use a solid checkmark circle
                Icon(
                  Icons.check_circle,
                  color: ilocateRed,
                  size: 150, // Increased the size for prominence
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'Respond to the Incident',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'has been confirmed!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Text(
                  'ID: $incidentId',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Check Incident log to update the\nstate of the incident.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48.0),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the MarkResolved page, passing a complete Alert object
                      // NOTE: I am using placeholder data for the other fields. You will need to
                      // replace this with actual data.
                      final alert = Alert(
                        rescueeName: 'John Doe',
                        incidentId: incidentId,
                        date: '2025-08-15',
                        time: '12:00 PM',
                        location: '123 Main St',
                        heartRate: '95 bpm',
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarkResolved(alert: alert),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: ilocateRed,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'NAVIGATE',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
