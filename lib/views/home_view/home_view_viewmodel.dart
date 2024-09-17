import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/views/home_view/model/firebse_user_model.dart';
import 'package:stacked_app/views/home_view/repositort/user_data_repository_service.dart';

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