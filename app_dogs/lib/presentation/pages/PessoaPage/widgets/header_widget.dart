import 'package:app_dogs/data/models/PessoaModel/pessoa_model.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Pessoa pessoa;

  const HeaderWidget({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color.fromARGB(255, 25, 150, 250),
          child: Text(
            pessoa.nome[0],
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            pessoa.nome,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
