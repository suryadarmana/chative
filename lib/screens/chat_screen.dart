import 'package:chative/components/message_box.dart';
import 'package:chative/components/message_stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  final _textController = TextEditingController();

  FirebaseUser loggedInUser;
  String messageBody;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        setState(() {
          loggedInUser = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.message),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'action_logout') {
                _auth.signOut();
                Navigator.pop(context);
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: 'display_useremail',
                child: Text('Logged in as ${loggedInUser.email}'),
              ),
              PopupMenuItem(
                value: 'action_logout',
                child: Text('Log Out'),
              ),
            ],
          ),
        ],
        title: Text('Chative Room'),
        backgroundColor: Colors.grey.shade800,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              stream: _firestore
                  .collection('messages')
                  .orderBy('date', descending: false)
                  .snapshots(),
              currentUser: loggedInUser.email,
            ),
            MessageBox(
              textController: _textController,
              onTextChange: (value) {
                messageBody = value;
              },
              onTextEnter: (value) {
                _firestore.collection('messages').add({
                  'sender': loggedInUser.email,
                  'text': messageBody,
                  'date': DateTime.now().millisecondsSinceEpoch
                });
                _textController.clear();
              },
              onSendClick: () {
                _firestore.collection('messages').add({
                  'sender': loggedInUser.email,
                  'text': messageBody,
                  'date': DateTime.now().millisecondsSinceEpoch
                });
                _textController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
