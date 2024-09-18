// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/cloud_firestore_service.dart';
import '../services/fetch_user_data_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/login_service.dart';
import '../services/signup_service.dart';
import '../services/token_storage_service.dart';
import '../views/chat_details/Repository/chat_repository_service.dart';
import '../views/chat_details/Repository/get_recived_chat_service.dart';
import '../views/chat_details/service/chat_service.dart';
import '../views/home_view/repositort/user_data_repository_service.dart';
import '../views/home_view/service/user_data_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => TokenStorageService());
  locator.registerLazySingleton(() => UserDataService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => SignupService());
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => CloudFirestoreService());
  locator.registerLazySingleton(() => FetchUserDataService());
  locator.registerLazySingleton(() => UserDataRepositoryService());
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => ChatRepositoryService());
  locator.registerLazySingleton(() => GetRecivedChatService());
}
