abstract class LoginRepository {
  /* Future<String?> loginAuth(LoginRequestModel loginRequest); */
  Future<String?> firebaseLoginAuth(String email, String password);
}
