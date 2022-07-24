import '../models/Noticia_model.dart';
import 'generic_service.dart';
import '../utils/list_extension.dart';

class NoticiaService implements GenericService<NoticiaModel>{
  
  final List<NoticiaModel> _fakaDB = [];



  @override
  bool delete(int id) {

   _fakaDB.removeWhere((e) => e.id == id);
   return true;
  }

  @override
  List<NoticiaModel> findAll() {
 
    return _fakaDB;
  }

  @override
  NoticiaModel findOne(int id) {
   return _fakaDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(NoticiaModel value) {
    NoticiaModel? model = _fakaDB.firstWhereOrNull((e) => e.id == value.id,);
    if(model == null){
      _fakaDB.add(value);
    }else{
      var index = _fakaDB.indexOf(model);
      _fakaDB[index] = value;

    }

     return true;
  }

}