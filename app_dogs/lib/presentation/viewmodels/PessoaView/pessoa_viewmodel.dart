import 'package:app_dogs/data/models/PessoaModel/pessoa_model.dart';
import 'package:app_dogs/data/repositories/PessoaRepositories/pessoa_repository.dart';

class PessoaViewModel {
  final PessoaRepository repository;

  PessoaViewModel(this.repository);

  Future<void> addPessoa(Pessoa pessoa) async {
    await repository.insertPessoa(pessoa);
  }

  Future<List<Pessoa>> getPessoas() async {
    return await repository.getPessoas();
  }

  Future<void> updatePessoa(Pessoa pessoa) async {
    await repository.updatePessoa(pessoa);
  }

  Future<void> deletePessoa(int? id) async {
    await repository.deletePessoa(id!);
  }
}
