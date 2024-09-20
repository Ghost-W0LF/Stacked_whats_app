import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/ui/views/chat_details/Repository/chat_repository_service.dart';
import 'package:stacked_app/ui/views/chat_details/model/chat_details_model.dart';
import 'package:stacked_app/ui/views/chat_details/service/chat_service.dart';
import 'package:stacked_app/ui/views/chat_details/widget/bottom_textfield.form.dart';

class ChatDetailsViewModel extends BaseViewModel with $BottomTextfield {
  ChatDetailsViewModel({required this.reciverID});

  final String reciverID;
  final String? sendersId = FirebaseAuth.instance.currentUser?.uid;
  final chatService = locator<ChatService>();
  //total message in database
  List<ChatDetailsModel> messagesList = [];
  //total message user sent
  List<ChatDetailsModel> sendersChatList = [];
  //total message user recive
  List<ChatDetailsModel> reciversChatList = [];

  //
  //total message user send ang recived
  List<ChatDetailsModel> totalMessage = [];

  final _chatRepositoryService = locator<ChatRepositoryService>();
  bool isLoading = true;

//To rebuilt ui
  void updateChat() {
    chatService.addMessage(chatBoxController.text, reciverID);
    rebuildUi();
    notifyListeners();
  }

  bool checkSender(index) {
    return totalMessage[index].senderID == reciverID;
  }

  Future<void> getChats() async {
    if (isLoading == true) {
      try {
        final featchedChat = await _chatRepositoryService.getMessage(reciverID);
        messagesList = featchedChat;
        notifyListeners();
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        await sendersChat();
        await reciverChat();
        totalMessage.addAll(sendersChatList);
        totalMessage.addAll(reciversChatList);
        totalMessage.sort((a, b) => a.timeStamp!.compareTo(b.timeStamp!));
        isLoading = false;
        notifyListeners();
      }
      notifyListeners();
    }
  }

  Future<void> reciverChat() async {
    // Filter messages that match senderID and reciverID
    reciversChatList = messagesList.where((message) {
      return message.reciverID == sendersId && message.senderID == reciverID;
    }).toList();
    debugPrint('Filtered Recived messages: ${reciversChatList.length}');
    notifyListeners();
  }

  // Method to filter messages where the senderID and reciverID match
  Future<void> sendersChat() async {
    sendersChatList = messagesList.where((message) {
      return message.senderID == sendersId && message.reciverID == reciverID;
    }).toList();

    // Optionally, you can debug print the filtered messages
    debugPrint('Filtered Sent messages: ${sendersChatList.length}');
    notifyListeners();
  }
}
