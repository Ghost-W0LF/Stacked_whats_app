import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService {
  final db = FirebaseFirestore.instance;
  void addMessage(String chatMessage, String receiverId) {
  
    final String? senderId = FirebaseAuth.instance.currentUser?.uid;

    if (senderId == null) {
      debugPrint("Error: Sender ID is null.");
      return;
    }

    // Create a new chat message data
    final message = <String, dynamic>{
      "message": chatMessage,
      "timestamp": FieldValue.serverTimestamp(), // Firestore server timestamp
      "senderId": senderId,
      "receiverId": receiverId,
    };

    // Reference to the sender's chat document in "Chats" collection
    final senderChatDoc = db.collection("Chats").doc(senderId);

    // Add the chat message under the "Messages" subcollection, where the subcollection's document ID is the receiverId
    senderChatDoc
        .collection("Messages")
        .doc(receiverId)
        .collection(
            'Conversations')// Add the message to the "Conversations" subcollection
        .add(message)
        .then((value) => debugPrint("Message added to subcollection"))
        .catchError((error) => debugPrint("Error adding message: $error"));
  }
}
