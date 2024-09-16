import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/ui/views/home_view/model/firebse_user_model.dart';
import 'package:stacked_app/ui/views/home_view/repositort/user_data_repository_service.dart';

class HomeViewViewModel extends BaseViewModel {
  List<FirebseUserModel>? userList = [];
  final _userRepository = locator<UserDataRepositoryService>();

  bool isLoading = true;

  Future<void> getUserData() async {
    if (isLoading == true) {
      try {
        final featchedData = await _userRepository.readUserData();
        if (featchedData != null) {
          userList = featchedData;
          isLoading = false;
          notifyListeners();
        } else {
          debugPrint('Failed to fetch data or data is null');
        }
      } catch (e) {
        debugPrint('this is the $e');
      }
    }
  }
}

  /*  UserData uData = UserData(data: []);

  final userRepository = UserRepositoryImplements();
  bool isLoading = false;

  Future<void> getPostData(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final featchedData = await userRepository.getUserData();
      if (featchedData != null) {
        uData = featchedData;
      } else {
        debugPrint('Failed to fetch data or data is null');
      }
    } catch (e) {
      debugPrint('this is the $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  } */

