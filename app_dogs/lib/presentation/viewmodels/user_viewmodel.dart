import 'package:app_dogs/data/repositories/user_repository.dart';

class UserViewmodel {
  final UserRepository repository;

  UserViewmodel(this.repository);

  Future<String> registerUser(
      String email, String usuario, String senha) async {
    final emailExists = await repository.emailExists(email);

    if (emailExists) {
      final db = await repository.initDb();
      final result =
          await db.query('pessoas', where: 'email = ?', whereArgs: [email]);
      final idPessoa = result[0]['id'] as int;

      final userAlreadyExists = await repository.userExistsByIdPessoa(idPessoa);
      if (userAlreadyExists) {
        return 'Usuario já Esta Cadastrado';
      }
    }
  }
}
