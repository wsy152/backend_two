abstract class SecurityService<T> {
  Future<String> genarateJWT(String userID);
   T? validateJTW(String token);
}