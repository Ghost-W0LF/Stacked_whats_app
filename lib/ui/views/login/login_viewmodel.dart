import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = NavigationService();
  void login() {
    _navigationService.navigateToHomeView();
  }
}
