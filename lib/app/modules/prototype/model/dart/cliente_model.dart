import 'package:design_patterns/app/modules/prototype/model/dart/i_prototype.dart';
import 'package:design_patterns/app/modules/prototype/model/dart/telefone_model.dart';

class ClienteModel implements IPrototype<ClienteModel> {
  String? nome;
  DateTime? dataNascimento;
  String? _cpf;
  List<TelefoneModel>? telefones;

  ClienteModel._();

  factory ClienteModel() {
    var c = ClienteModel._();
    c.nome = 'João';
    c.dataNascimento = DateTime.now();
    c._cpf = '123123123123123';
    c.telefones = [
      TelefoneModel(telefone: '(12) 321321321'),
      TelefoneModel(telefone: '(11) 321321321'),
    ];
    return c;
  }

  @override
  ClienteModel clone() {
    var c = ClienteModel();
    c.nome = nome;
    c.dataNascimento = dataNascimento;
    c._cpf = _cpf;

    //* Para não ficar com a mesma referência de memória
    c.telefones = [...telefones!];
    return c;
  }

  @override
  String toString() {
    return 'ClienteModel(nome: $nome, dataNascimento: $dataNascimento, _cpf: $_cpf, telefones: $telefones)';
  }
}
