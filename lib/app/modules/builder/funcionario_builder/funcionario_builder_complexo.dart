import 'package:design_patterns/app/modules/builder/model/filho_model.dart';
import 'package:design_patterns/app/modules/builder/model/funcionario_model.dart';

class FuncionarioBuilderComplexo
    implements
        FuncionarioNome,
        FuncionarioIdade,
        FuncionarioProfissao,
        FuncionarioFilhos {
  final FuncionarioModel _funcionario = FuncionarioModel();

  FuncionarioBuilderComplexo._();

  static FuncionarioNome get instance => FuncionarioBuilderComplexo._();

  @override
  FuncionarioIdade nome(String nome) {
    _funcionario.nome = nome;
    return this;
  }

  @override
  FuncionarioProfissao idade(int idade) {
    _funcionario.idade = idade;
    return this;
  }

  @override
  FuncionarioFilhos profissao(String profissao) {
    _funcionario.profissao = profissao;
    return this;
  }

  @override
  FuncionarioFilhos addFilho(FilhoModel filho) {
    _funcionario.filhos ??= [];
    _funcionario.filhos!.add(filho);
    return this;
  }

  @override
  FuncionarioModel build() {
    return _funcionario;
  }
}

abstract class FuncionarioNome {
  FuncionarioIdade nome(String nome);
}

abstract class FuncionarioIdade {
  FuncionarioProfissao idade(int idade);
}

abstract class FuncionarioProfissao {
  FuncionarioFilhos profissao(String profissao);
}

abstract class FuncionarioFilhos {
  FuncionarioFilhos addFilho(FilhoModel filho);
  FuncionarioModel build();
}
