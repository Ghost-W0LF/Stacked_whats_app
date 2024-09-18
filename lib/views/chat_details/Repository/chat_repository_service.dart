import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/views/chat_details/model/chat_details_model.dart';

class ChatRepositoryService extends BaseViewModel {
  final db = FirebaseFirestore.instance;
  List<ChatDetailsModel> messagesListSent = [];
  bool isLoading = true;

  // Method to retrieve chat messages between sender and receiver
  Future<List<ChatDetailsModel>> getMessage(String receiverId) async {
    messagesListSent.clear();
    try {
      isLoading = true;
      // Reference to the Conversations subcollection (for sender -> receiver)
      final messagesSnapshot = await db
          .collection("Chats")
          .orderBy("timestamp", descending: false) // Order by timestamp
          .get();

      // Loop through each document in the snapshot and add the message data to the list
      for (var doc in messagesSnapshot.docs) {
        messagesListSent.add(ChatDetailsModel(
            message: doc['message'],
            reciverID: doc['receiverId'],
            senderID: doc['senderId'],
            timeStamp: doc['timestamp']));
      }

      debugPrint("Retrieved ${messagesListSent.length} messages.");
    } catch (e) {
      debugPrint("Error sent retrieving messages: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }

    return messagesListSent;
  }
}
