
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/securiry_service.dart';

class LoginApi {
  final SecurityService _securityService;
  LoginApi(this._securityService);

  Handler get handler {
    Router router = Router();

    router.post('/login', (Request req)async{
      var token = await _securityService.genarateJWT('1');
      var result = await _securityService.validateJTW(token);



      return Response.ok(token);
    });
    return router;
  }
}
