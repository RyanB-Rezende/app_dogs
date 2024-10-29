import 'package:app_dogs/data/models/dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogPageForm extends StatefulWidget {
  const DogPageForm({super.key});

  @override
  State<DogPageForm> createState() => _DogPageFormState();
}

class _DogPageFormState extends State<DogPageForm> {
  final _formkey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();

  Future<void> saveDog() async {
    if (_formkey.currentState!.validate()) {
      final dog = Dog(
        name: nomeController.text,
        age: int.parse(idadeController.text),
      );
      print(dog.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Dogs'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        const Text(
                          'Cadastrar um novo Dog',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor entre com um nome';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: idadeController,
                          decoration: const InputDecoration(
                            labelText: 'Idade',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor entre com uma idade';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Por favor entre com numeros validos';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: saveDog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
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
                            'Salvar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
