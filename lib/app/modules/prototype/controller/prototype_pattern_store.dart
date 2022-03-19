import 'package:design_patterns/app/modules/prototype/model/mobx/cliente.dart';
import 'package:mobx/mobx.dart';

part 'prototype_pattern_store.g.dart';

class PrototypePatternStore = _PrototypePatternStoreBase
    with _$PrototypePatternStore;

abstract class _PrototypePatternStoreBase with Store {
  @observable
  Cliente? cliente;

  @action
  void loadCliente() {
    cliente = Cliente(
      nome: 'João',
      telefone: '123123123',
      idade: 22,
    );
  }

  @action
  void fazerAniversario() {
    //* Com o copyWith, clono o objeto e altero algumas propriedades da instância dele,
    //* presenvando as outras propriedades dessa mesma instância.
    cliente = cliente!.copyWith(
      idade: cliente!.idade + 1,
    );

    //! cliente!.idade += 1;

    // cliente = Cliente(
    //   nome: cliente!.nome,
    //   telefone: cliente!.telefone,
    //   idade: cliente!.idade + 1,
    // );
  }
}
