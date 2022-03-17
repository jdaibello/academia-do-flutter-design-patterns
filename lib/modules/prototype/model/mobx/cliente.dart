class Cliente {
  String nome;
  String telefone;
  int idade;

  Cliente({
    required this.nome,
    required this.telefone,
    required this.idade,
  });

  Cliente copyWith({
    String? nome,
    String? telefone,
    int? idade,
  }) {
    return Cliente(
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      idade: idade ?? this.idade,
    );
  }
}
