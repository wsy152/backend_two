class NoticiaModel {
   int? id;
   String? titulo;
   String? descricao;
   String? imagem;
   DateTime? dtPublicacao;
   DateTime? dtAtualizacao;

  NoticiaModel({
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dtPublicacao,
    this.dtAtualizacao,
    });

  factory NoticiaModel.fromJson(Map<String, dynamic> json) => NoticiaModel(
    id: json['id'],    
    titulo:json['titulo'],
    descricao:json['descricao'],
    imagem:json['imagem'],
    dtPublicacao: DateTime.fromMicrosecondsSinceEpoch(json['dtPublicacao']),
    dtAtualizacao: DateTime.fromMicrosecondsSinceEpoch(json['dtAtualizacao']),
    );

    Map toJson(){
      return {
        "id": id,
        "titulo":titulo,
        "descricao":descricao,
        "imagem": imagem,
      };
     }



     



  @override
  String toString() {
  return 'NoticiaModel(id: $id, titilo: $titulo, descricao: $descricao, imagem: $imagem, dtPlublicacao: $dtPublicacao, dtAtulizacao: $dtAtualizacao)';
  }
}

