import 'package:app_dogs/data/models/PessoaModel/pessoa_model.dart';
import 'package:app_dogs/presentation/pages/DogPages/dog_page.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/pessoa_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bem-vindo ao App de Gestão!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Gerencie Seus Pets e Clientes de Forma Fácil e Rápida.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            icon: const Icon(Icons.pets),
            label: const Text('Acessar Dogs'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DogPage()),
              );
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            icon: const Icon(Icons.people),
            label: const Text('Acessar Clientes'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PessoaPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
