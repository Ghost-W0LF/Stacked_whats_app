import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDetailsModel {
  final String? message;
  final String? senderID;
  final String? reciverID;
  final Timestamp? timeStamp;
  ChatDetailsModel(
      {this.message, this.senderID, this.reciverID, this.timeStamp});

  toJson() {
    return {
      "Message": message,
      "SenderID": senderID,
      "ReciverID": reciverID,
      "TimeStamp": timeStamp
    };
  }
}
