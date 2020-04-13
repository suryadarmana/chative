import 'package:flutter/material.dart';
import 'package:chative/utils/constants.dart';

class MessageBox extends StatelessWidget {
  final Function(String) onTextChange;
  final Function onSendClick;
  final Function(String) onTextEnter;
  final TextEditingController textController;

  MessageBox(
      {this.onTextChange,
      this.onSendClick,
      this.textController,
      this.onTextEnter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kMessageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textController,
              onChanged: onTextChange,
              onSubmitted: onTextEnter,
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          IconButton(
            onPressed: onSendClick,
            icon: Icon(
              Icons.send,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
