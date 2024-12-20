import 'package:app_dogs/data/models/PessoaModel/pessoa_model.dart';
import 'package:app_dogs/data/repositories/PessoaRepositories/pessoa_repository.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/pessoa_detail_page.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/pessoa_edit_page.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/pessoa_page_form.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/widgets/detail_row_widgets.dart';
import 'package:app_dogs/presentation/viewmodels/PessoaView/pessoa_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PessoaPage extends StatefulWidget {
  const PessoaPage({super.key});

  @override
  PessoaPageState createState() => PessoaPageState();
}

class PessoaPageState extends State<PessoaPage> {
  List<Pessoa> _pessoas = [];
  final PessoaViewModel _viewModel = PessoaViewModel(PessoaRepository());
  Pessoa? _lastDeletedPessoa;

  @override
  void initState() {
    super.initState();
    _loadPessoas();
  }

  Future<void> _loadPessoas() async {
    final pessoas = await _viewModel.getPessoas();
    if (mounted) {
      setState(() {
        _pessoas = pessoas;
      });
    }
  }

  Future<void> _deletePessoa(Pessoa pessoa) async {
    await _viewModel.deletePessoa(pessoa.id!);
    _lastDeletedPessoa = pessoa;
    _showDeletionSnackbar(pessoa);
    await _loadPessoas();
  }

  void _showDeletionSnackbar(Pessoa pessoa) {
    final snackBar = SnackBar(
      content: Text('${pessoa.nome} deletado!'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: _undoDeletion,
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _undoDeletion() {
    if (_lastDeletedPessoa != null) {
      final pessoa = _lastDeletedPessoa!;
      _viewModel.addPessoa(pessoa);
      setState(() {
        _pessoas.add(pessoa);
        _lastDeletedPessoa = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exclusão de ${pessoa.nome} desfeita!')),
      );
    }
  }

  Widget _buildPessoaCard(Pessoa pessoa) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade300,
          child: Text(
            pessoa.nome[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          pessoa.nome,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Telefone: ${pessoa.telefone}'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PessoaDetailPage(pessoa: pessoa)),
                );
              },
              child: const Text(
                'Mais Detalhes',
                style: TextStyle(
                    color: Color.fromARGB(255, 25, 150, 250),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.orange),
              onPressed: () => _editPessoa(pessoa),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deletePessoa(pessoa),
            ),
          ],
        ),
      ),
    );
  }

  void _editPessoa(Pessoa pessoa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PessoaEditPage(pessoa: pessoa),
      ),
    ).then((_) => _loadPessoas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pessoas'),
        backgroundColor: const Color.fromARGB(255, 25, 150, 250),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _pessoas.isEmpty
            ? const Center(child: Text('Nenhuma pessoa disponível.'))
            : ListView.builder(
                itemCount: _pessoas.length,
                itemBuilder: (context, index) =>
                    _buildPessoaCard(_pessoas[index]),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPessoa,
        backgroundColor: const Color.fromARGB(255, 0, 255, 255),
        tooltip: 'Adicionar Pessoa',
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  void _addPessoa() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PessoaPageForm()),
    ).then((_) => _loadPessoas());
  }
}
