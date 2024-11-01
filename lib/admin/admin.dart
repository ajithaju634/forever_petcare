import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminFeedbackPage extends StatelessWidget {
  const AdminFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Feedback"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 85, 176, 92),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('feedback').orderBy('timestamp', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No feedback available.'));
            }

            final feedbackDocs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: feedbackDocs.length,
              itemBuilder: (context, index) {
                final feedback = feedbackDocs[index].data() as Map<String, dynamic>;
                final email = feedback['email'];
                final content = feedback['feedback'];
                final timestamp = (feedback['timestamp'] as Timestamp).toDate();

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: $email", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("Feedback: $content"),
                        SizedBox(height: 4),
                        Text("Submitted on: ${timestamp.toLocal()}"),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
