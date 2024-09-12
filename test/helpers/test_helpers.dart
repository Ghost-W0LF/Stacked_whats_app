import 'package:mockito/annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_app/services/login_service.dart';
import 'package:stacked_app/services/token_storage_service.dart';

import 'package:stacked_app/services/signup_service.dart';

// @stacked-import
@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TokenStorageService>(onMissingStub: OnMissingStub.returnDefault),

  MockSpec<SignupService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterSignupService();
// @stacked-mock-register
}

void getAndRegisterNavigationService() {}
