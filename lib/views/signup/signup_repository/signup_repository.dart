import 'package:stacked_app/views/signup/model/signup_request_model.dart';

abstract class SignupRepository {
  Future<void> signupAuth(SignupRequestModel signupRequestModel);
}
