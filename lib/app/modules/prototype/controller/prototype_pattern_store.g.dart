// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prototype_pattern_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrototypePatternStore on _PrototypePatternStoreBase, Store {
  final _$clienteAtom = Atom(name: '_PrototypePatternStoreBase.cliente');

  @override
  Cliente? get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(Cliente? value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$_PrototypePatternStoreBaseActionController =
      ActionController(name: '_PrototypePatternStoreBase');

  @override
  void loadCliente() {
    final _$actionInfo = _$_PrototypePatternStoreBaseActionController
        .startAction(name: '_PrototypePatternStoreBase.loadCliente');
    try {
      return super.loadCliente();
    } finally {
      _$_PrototypePatternStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fazerAniversario() {
    final _$actionInfo = _$_PrototypePatternStoreBaseActionController
        .startAction(name: '_PrototypePatternStoreBase.fazerAniversario');
    try {
      return super.fazerAniversario();
    } finally {
      _$_PrototypePatternStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cliente: ${cliente}
    ''';
  }
}
