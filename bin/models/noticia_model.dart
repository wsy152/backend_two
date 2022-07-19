// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
class NoticiaModel {
  final int id;
  final String titilo;
  final String descricao;
  final String imagem;
  final DateTime dtPlublicacao;
  final DateTime? dtAtulizacao;

  NoticiaModel(
    this.id,
    this.titilo,
    this.descricao,
    this.imagem,
    this.dtPlublicacao,
    this.dtAtulizacao,
  );

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titilo: $titilo, descricao: $descricao, imagem: $imagem, dtPlublicacao: $dtPlublicacao, dtAtulizacao: $dtAtulizacao)';
  }
}
