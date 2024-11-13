import 'package:app_dogs/data/models/PessoaModel/pessoa_model.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/widgets/detail_row_widgets.dart';
import 'package:app_dogs/presentation/pages/PessoaPage/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PessoaDetailPage extends StatelessWidget {
  final Pessoa pessoa;

  const PessoaDetailPage({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detahes de ${pessoa.nome}'),
        backgroundColor: const Color.fromARGB(255, 25, 150, 250),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(pessoa: pessoa),
              const SizedBox(height: 20),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRowWidgets(
                          icon: FontAwesomeIcons.phone,
                          label: 'Telefone',
                          value: pessoa.telefone),
                      DetailRowWidgets(
                          icon: FontAwesomeIcons.envelope,
                          label: 'E-mail',
                          value: pessoa.email),
                      DetailRowWidgets(
                          icon: FontAwesomeIcons.house,
                          label: 'Endereço',
                          value:
                              "${pessoa.enderecoAvRua},${pessoa.enderecoNumero}"),
                      DetailRowWidgets(
                          icon: FontAwesomeIcons.locationArrow,
                          label: 'CEP',
                          value: pessoa.enderecoCep),
                      DetailRowWidgets(
                          icon: FontAwesomeIcons.city,
                          label: 'Cidade',
                          value: pessoa.enderecoCidade),
                      DetailRowWidgets(
                          icon: FontAwesomeIcons.mapLocationDot,
                          label: 'Estado',
                          value: pessoa.enderecoEstado),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
