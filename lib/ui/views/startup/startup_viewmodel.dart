import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/services/token_storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final tokenStorage = locator.get<TokenStorageService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final user = FirebaseAuth.instance.currentUser;
  

    user != null
        ? _navigationService.replaceWithHomeViewView()
        : _navigationService.replaceWithLoginView();
  }
}
