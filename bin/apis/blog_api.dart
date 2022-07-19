
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';


class BlogApi {
  final GenericService _service;
  BlogApi(this._service);



  Handler get handler{
    Router router = Router();


    router.get('/blog/noticias', (Request req){
      _service.findAll();

      return Response.ok('Choveu hoje');

    });

    router.post('/blog/noticias',(Request req){
      
      String? id = req.url.queryParameters['id'];
      _service.save('teset');

      return Response.ok('Choveu hoje');
    });

     router.delete('/blog/noticias',(Request req){
      String? id = req.url.queryParameters['id'];

      _service.save('teset');
      
      return Response.ok('Deletado com sucesso!!');
    });



    return router;
  }
  
}