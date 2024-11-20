import 'package:app_dogs/data/models/PessoaModel/pessoa_model.dart';
import 'package:app_dogs/data/repositories/PessoaRepositories/pessoa_repository.dart';
import 'package:app_dogs/presentation/viewmodels/PessoaView/pessoa_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PessoaEditPage extends StatefulWidget {
  final Pessoa pessoa;

  const PessoaEditPage({super.key, required this.pessoa});

  @override
  PessoaEditPageState createState() => PessoaEditPageState();
}

class PessoaEditPageState extends State<PessoaEditPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoAvRuaController = TextEditingController();
  final _bairroController = TextEditingController();
  final _enderecoNumeroController = TextEditingController();
  final _enderecoCepController = TextEditingController();
  final _enderecoCidadeController = TextEditingController();
  final _enderecoEstadoController = TextEditingController();
  final PessoaViewModel _viewModel = PessoaViewModel(PessoaRepository());

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.pessoa.nome;
    _telefoneController.text = widget.pessoa.telefone;
    _emailController.text = widget.pessoa.email;
    _enderecoAvRuaController.text = widget.pessoa.enderecoAvRua;
    _bairroController.text = widget.pessoa.bairro;
    _enderecoNumeroController.text = widget.pessoa.enderecoNumero;
    _enderecoCepController.text = widget.pessoa.enderecoCep;
    _enderecoCidadeController.text = widget.pessoa.enderecoCidade;
    _enderecoEstadoController.text = widget.pessoa.enderecoEstado;
  }

  @override
  void dispose() {
    nomeController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    _enderecoAvRuaController.dispose();
    _bairroController.dispose();
    _enderecoNumeroController.dispose();
    _enderecoCepController.dispose();
    _enderecoCidadeController.dispose();
    _enderecoEstadoController.dispose();
    super.dispose();
  }

  _updatePessoa() async {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedPessoa = Pessoa(
          id: widget.pessoa.id, // Mantém o ID original
          nome: nomeController.text,
          telefone: _telefoneController.text,
          email: _emailController.text,
          enderecoAvRua: _enderecoAvRuaController.text,
          bairro: _bairroController.text,
          enderecoNumero: _enderecoNumeroController.text,
          enderecoCep: _enderecoCepController.text,
          enderecoCidade: _enderecoCidadeController.text,
          enderecoEstado: _enderecoEstadoController.text);

      await _viewModel.updatePessoa(updatedPessoa);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pessoa atualizado com sucesso!')),
        );
        Navigator.pop(context, updatedPessoa); // Retorna o pessoa atualizado
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição Pessoa'),
        backgroundColor: const Color.fromARGB(255, 25, 150, 250),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Editar Pessoa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 150, 250),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: nomeController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com um nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _telefoneController,
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com o Telefone';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um Telefone válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com Email';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um Email válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _enderecoAvRuaController,
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com o Endereço (Avenida, Rua, etc)';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um Endereço válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _bairroController,
                        decoration: const InputDecoration(
                          labelText: 'Bairro',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com o Número';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um Número válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _enderecoNumeroController,
                        decoration: const InputDecoration(
                          labelText: 'Número',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com o Número';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um Número válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _enderecoCepController,
                        decoration: const InputDecoration(
                          labelText: 'CEP',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com o CEP';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um CEP válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _enderecoCidadeController,
                        decoration: const InputDecoration(
                          labelText: 'Cidade',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com a Cidade';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com uma Cidade válida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _enderecoEstadoController,
                        decoration: const InputDecoration(
                          labelText: 'Estado',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 57, 104)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 57, 104)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com o Estado';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Por favor entre com um Estado válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _updatePessoa,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 25, 150, 250),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 30.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        icon: const Icon(Icons.save, size: 24),
                        label: const Text(
                          'Salvar Alterações',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
