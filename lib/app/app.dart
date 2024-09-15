import 'package:stacked_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_app/ui/views/login/login_view.dart';
import 'package:stacked_app/services/login_service.dart';
import 'package:stacked_app/services/token_storage_service.dart';
import 'package:stacked_app/ui/views/home_view/home_view_view.dart';
import 'package:stacked_app/services/user_data_service.dart';
import 'package:stacked_app/ui/views/chat_details/chat_details_view.dart';
import 'package:stacked_app/ui/views/signup/signup_view.dart';
import 'package:stacked_app/services/signup_service.dart';
import 'package:stacked_app/services/firebase_auth_service.dart';
import 'package:stacked_app/services/cloud_firestore_service.dart';
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
