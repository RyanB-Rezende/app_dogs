class User {
  final int? id;
  final int idPessoa;
  final String usuario;
  final String senha;

  User({
    this.id,
    required this.idPessoa,
    required this.usuario,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPessoa': idPessoa,
      'usuario': usuario,
      'senha': senha,
    };
  }
}
