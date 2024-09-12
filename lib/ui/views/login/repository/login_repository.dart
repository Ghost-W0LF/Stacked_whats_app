import 'package:stacked_app/ui/views/login/model/login_request_model.dart';


abstract class LoginRepository {
  Future<String?> loginAuth(LoginRequestModel loginRequest);
  
}