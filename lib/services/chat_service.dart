import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatService with ListenableServiceMixin {
  final List<String> chats = [''];

  updateChat(TextEditingController messageController) {
    chats.add(messageController.text);
    notifyListeners();
  }
}
