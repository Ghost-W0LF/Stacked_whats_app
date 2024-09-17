import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/views/chat_details/Repository/chat_repository_service.dart';
import 'package:stacked_app/views/chat_details/model/chat_details_model.dart';

class ChatDetailsViewModel extends BaseViewModel {
  ChatDetailsViewModel({this.reciverID});
  final String? reciverID;

  List<ChatDetailsModel> messagesList = [];
  final _chatRepositoryService = locator<ChatRepositoryService>();

  bool isLoading = true;

  Future<void> getChats() async {
    try {
      final featchedChat =
          await _chatRepositoryService.getMessages(reciverID.toString());
      messagesList = featchedChat;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
