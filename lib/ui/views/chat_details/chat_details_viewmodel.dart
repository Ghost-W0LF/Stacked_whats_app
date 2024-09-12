import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatDetailsViewModel extends BaseViewModel {
  List<String> chats = ["HI", "Hello"];

  updateChat(TextEditingController messageController) {
    chats.add(messageController.text);

    notifyListeners();
  }
}
