import 'package:shelf/shelf.dart';

abstract class SecurityService<T> {

  Future<String> genarateJWT(String userID);
   
  Future<T?> validateJTW(String token);

  Middleware get verifyJwt;

  Middleware get authorization;

  
}