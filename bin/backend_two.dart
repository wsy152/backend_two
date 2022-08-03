import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/securiry_service.dart';
import 'infra/security/security_service_imp.dart';
import 'services/noticia_service.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fomFile('.env-dev');

   SecurityService securityService = SecurityServiceImp();


  var cascadeHandler = Cascade()
      .add(LoginApi(securityService).getHandler(middlerware: [
        createMiddleware(requestHandler: (Request req){
          print('LOG -> ${req.url}');
          return null;

        })
      ]))
      .add(BlogApi(NoticiaService()).handler)
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middlerware)
      .addMiddleware(securityService.authorization)
      .addMiddleware(securityService.verifyJwt)
      .addHandler(cascadeHandler);

      

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
