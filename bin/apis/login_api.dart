
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/securiry_service.dart';
import 'api.dart';

class LoginApi extends Api{
  final SecurityService _securityService;
  LoginApi(this._securityService);


  @override
  Handler getHandler({List<Middleware>? middlerware}) {
  Router router = Router();

    router.post('/login', (Request req)async{
      var token = await _securityService.genarateJWT('1');
      var result = await _securityService.validateJTW(token);



      return Response.ok(token);
    });
    return createHandler(router: router,middlerware: middlerware );
  }
}
