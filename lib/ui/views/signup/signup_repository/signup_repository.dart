import 'package:stacked_app/ui/views/signup/model/signup_request_model.dart';

abstract class SignupRepository {
  Future<void> signupAuth(SignupRequestModel signupRequestModel);
}
