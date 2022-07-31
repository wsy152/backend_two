
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../utils/custom_env.dart';
import 'securiry_service.dart';

class SecurityServiceImp implements SecurityService<JWT> {
  @override
  Future<String> genarateJWT(String userID) async {
    var jwt = JWT({'iat': DateTime.now().millisecondsSinceEpoch, 'userId': userID,'roles':['admin','user']});

    String key = await CustomEnv.get(key: 'jwt_key');
    String token = jwt.sign(SecretKey(key));

    return token;
  }

  @override
  Future<JWT?> validateJTW(String token) async {

    String key = await CustomEnv.get(key: 'jwt_key');
   try {
    return JWT.verify(token,SecretKey(key));
     
    } on JWTInvalidError {
      return null;
    } on JWTExpiredError {
      return null;
    } on JWTNotActiveError {
      return null;
    } on JWTUndefinedError {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Middleware get authorization {
    return (Handler handler){
      return (Request req)async{
        String? authorizationHerader = req.headers['Authorization'];

        JWT? jwt;

        if(authorizationHerader !=null){
          if(authorizationHerader.startsWith('Bearer ')){
            String token = authorizationHerader.substring(7);
            
            jwt = await validateJTW(token);

          }

        }
        Request request = req.change(context: {'jwt':jwt});

        return handler(request);
      };
    };
  } 

  @override

  Middleware get verifyJwt => throw UnimplementedError();

}