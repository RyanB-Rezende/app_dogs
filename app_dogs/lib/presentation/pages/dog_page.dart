import 'package:app_dogs/data/models/dog_model.dart';
import 'package:app_dogs/data/repositories/dog_repository.dart';
import 'package:app_dogs/presentation/viewmodels/dog_viewmodel.dart';
import 'package:flutter/material.dart';

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  List<Dog> _dogs = [];
  final DogViewModel _viewModel = DogViewModel(DogRepository());

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  Future<void> _loadDogs() async {
    _dogs = await _viewModel.getDogs();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Dogs'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _dogs.isEmpty
            ? const Center(child: Text('Nenhum Dog Disponivel.'))
            : ListView.builder(
                itemCount: _dogs.length,
                itemBuilder: (context, index) {
                  final dog = _dogs[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(
                          dog.name[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: Text('Idade: ${dog.age}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        tooltip: 'Adicionar Dog',
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
