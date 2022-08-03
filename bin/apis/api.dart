import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlerware});

  Handler createHandler({required router, List<Middleware>? middlerware}){
    middlerware ??= [];
    var pipe = Pipeline();

    // ignore: avoid_function_literals_in_foreach_calls
    middlerware.forEach((m) =>  pipe = pipe.addMiddleware(m));

    

    return pipe.addHandler(router);
  }
}