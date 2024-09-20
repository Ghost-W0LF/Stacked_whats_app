import 'package:mockito/annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_app/views/login/services/login_service.dart';
import 'package:stacked_app/services/token_storage_service.dart';

import 'package:stacked_app/views/signup/service/signup_service.dart';

import 'package:stacked_app/views/login/services/firebase_auth_service.dart';

import 'package:stacked_app/views/chat_details/service/cloud_firestore_service.dart';

import 'package:stacked_app/views/home_view/service/fetch_user_data_service.dart';

import 'package:stacked_app/views/home_view/repositort/user_data_repository_service.dart';

import 'package:stacked_app/views/chat_details/service/chat_service.dart';

import 'package:stacked_app/views/chat_details/Repository/chat_repository_service.dart';

import 'package:stacked_app/views/chat_details/Repository/get_recived_chat_service.dart';

// @stacked-import
@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TokenStorageService>(onMissingStub: OnMissingStub.returnDefault),

  MockSpec<SignupService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FirebaseAuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CloudFirestoreService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchUserDataService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserDataRepositoryService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChatService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChatRepositoryService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GetRecivedChatService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterChatService();
  getAndRegisterChatService();
// @stacked-mock-register
}

void getAndRegisterChatService() {}

void getAndRegisterNavigationService() {}
