import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class MessageStream extends StatelessWidget {
  //final firestoreInstance;
  final Stream<QuerySnapshot> stream;
  final String currentUser;

  MessageStream({this.stream, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Column(
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.amber,
              ),
            ],
          );
        } else {
          // Reverse the order so that the newer messages appear at the bottom
          final messages = snapshot.data.documents.reversed.toList();

          return Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                String sender = messages[index]['sender'];

                return MessageBubble(
                  messageBody: messages[index]['text'],
                  sender: sender,
                  isCurrentUser: sender == currentUser,
                );
              },
            ),
          );
        }
      },
    );
  }
}
