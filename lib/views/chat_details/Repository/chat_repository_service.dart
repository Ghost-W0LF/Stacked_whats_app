import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked_app/views/chat_details/model/chat_details_model.dart';

class ChatRepositoryService {
  final db = FirebaseFirestore.instance;
  List<ChatDetailsModel> messagesList = [];

  // Method to retrieve chat messages between sender and receiver
  Future<List<ChatDetailsModel>> getMessages(String receiverId) async {
    messagesList.clear();
    try {
      // Get the current user's ID (senderId)
      final String? senderId = FirebaseAuth.instance.currentUser?.uid;

      // Reference to the Conversations subcollection (for sender -> receiver)
      final messagesSnapshot = await db
          .collection("Chats")
          .doc(senderId)
          .collection("Messages")
          .doc(receiverId)
          .collection("Conversations")
          .orderBy("timestamp", descending: false) // Order by timestamp
          .get();

      // Loop through each document in the snapshot and add the message data to the list
      for (var doc in messagesSnapshot.docs) {
        messagesList.add(ChatDetailsModel(
            message: doc['message'],
            senderID: doc['senderId'],
            reciverID: doc['receiverId'],
            timeStamp: doc['timestamp']));
      }

      debugPrint("Retrieved ${messagesList.length} messages.");
    } catch (e) {
      debugPrint("Error retrieving messages: $e");
    }

    return messagesList;
  }
}
