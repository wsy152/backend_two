import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

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
  validateJTW(String token) {
   
    throw UnimplementedError();
  }

}