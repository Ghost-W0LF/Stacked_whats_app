import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  void addMessage(String chatMessage, String receiverId) {
    final String? senderId = FirebaseAuth.instance.currentUser?.uid;

    if (senderId == null) {
      debugPrint("Error: Sender ID is null.");
      return;
    }

    // Create a new chat message data
    final message = <String, dynamic>{
      "message": chatMessage.trim(),
      "timestamp": FieldValue.serverTimestamp(), // Firestore server timestamp
      "senderId": senderId,
      "receiverId": receiverId,
    };

    // Reference to the sender's chat document in "Chats" collection
    db
        .collection("Chats")
        .doc() // Add the message to the "Conversations" subcollection
        .set(message)
        .then((value) => debugPrint("Message added to subcollection"))
        .catchError((error) => debugPrint("Error adding message: $error"));

      

    // Add the chat message under the "Messages" subcollection, where the subcollection's document ID is the receiverId
  }
}
