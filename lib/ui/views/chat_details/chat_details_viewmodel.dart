import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatDetailsViewModel extends ReactiveViewModel {
  final List<String> chats = [];

  updateChat(TextEditingController messageController) {
    chats.add(messageController.text);
    notifyListeners();
  }
}
