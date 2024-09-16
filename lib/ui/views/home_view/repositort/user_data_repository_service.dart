import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked_app/ui/views/home_view/model/firebse_user_model.dart';
import 'package:stacked_app/ui/views/home_view/repositort/user_repository.dart';

class UserDataRepositoryService implements UserRepository {
  List<FirebseUserModel> userList = [];

  @override
  Future<List<FirebseUserModel>?> readUserData() async {
    userList.clear();

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      QuerySnapshot querySnapshot = await users.get();
      for (var doc in querySnapshot.docs) {
        userList.add(FirebseUserModel(name: doc['name'], email: doc['email']));
      }
      debugPrint("User list length after fetching: ${userList.length}");
    } catch (e) {
      debugPrint("Error fetching users: $e");
    }

    return userList;
  }
}
