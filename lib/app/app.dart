import 'package:stacked_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_app/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_app/views/login/login_view.dart';
import 'package:stacked_app/services/login_service.dart';
import 'package:stacked_app/services/token_storage_service.dart';
import 'package:stacked_app/views/home_view/home_view_view.dart';
import 'package:stacked_app/views/home_view/service/user_data_service.dart';
import 'package:stacked_app/views/chat_details/chat_details_view.dart';
import 'package:stacked_app/views/signup/signup_view.dart';
import 'package:stacked_app/services/signup_service.dart';
import 'package:stacked_app/services/firebase_auth_service.dart';
import 'package:stacked_app/services/cloud_firestore_service.dart';
import 'package:stacked_app/services/fetch_user_data_service.dart';
import 'package:stacked_app/views/home_view/repositort/user_data_repository_service.dart';
import 'package:stacked_app/views/chat_details/service/chat_service.dart';
import 'package:stacked_app/views/chat_details/Repository/chat_repository_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeViewView),
    MaterialRoute(page: ChatDetailsView),
    // MaterialRoute(page: ButtomTextField),
    MaterialRoute(page: SignupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: TokenStorageService),
    LazySingleton(classType: UserDataService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SignupService),
    LazySingleton(classType: FirebaseAuthService),
    LazySingleton(classType: CloudFirestoreService),
    LazySingleton(classType: FetchUserDataService),
    LazySingleton(classType: UserDataRepositoryService),
    LazySingleton(classType: ChatService),
    LazySingleton(classType: ChatRepositoryService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
