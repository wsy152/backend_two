
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/Noticia_model.dart';

import '../services/generic_service.dart';


class BlogApi {
  final GenericService<NoticiaModel> _service;
  BlogApi(this._service);



  Handler get handler{
    Router router = Router();


    router.get('/blog/noticias', (Request req){
      var noticias = _service.findAll();

      List<Map> noticiasMap = noticias.map((e) => e.toJson()).toList();
      
      


      return Response.ok(jsonEncode(noticiasMap),headers: {'content-type':"application/json"});

    });

    router.post('/blog/noticias',(Request req) async {

      var body = await req.readAsString();      

      _service.save(NoticiaModel.fromJson(jsonDecode(body)));

      return Response(201);
    });

     router.delete('/blog/noticias',(Request req){
      //String? id = req.url.queryParameters['id'];

      //_service.save('teset');
      
      return Response.ok('Deletado com sucesso!!');
    });



    return router;
  }
  
}