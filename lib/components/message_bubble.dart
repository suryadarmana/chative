import 'package:chative/utils/constants.dart';
import 'package:chative/utils/dateutils.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageBody;
  final String sender;
  final int timestamp;
  final bool isCurrentUser;

  MessageBubble(
      {this.messageBody, this.sender, this.isCurrentUser, this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            isCurrentUser ? 'You' : sender,
            style: TextStyle(fontSize: 12.0, color: Colors.grey.shade500),
          ),
          Text(
            DateUtils.readTimestamp(timestamp),
            style: TextStyle(fontSize: 12.0, color: Colors.grey.shade500),
          ),
          SizedBox(
            height: 8.0,
          ),
          Material(
            color: isCurrentUser ? Colors.grey.shade800 : Colors.amber.shade900,
            borderRadius:
                isCurrentUser ? kBorderMessageUser : kBorderMessageOthers,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                messageBody,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
