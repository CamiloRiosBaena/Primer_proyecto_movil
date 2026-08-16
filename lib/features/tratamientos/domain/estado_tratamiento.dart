import 'package:primer_app/core/json.dart';

sealed class EstadoTratamiento {
  const EstadoTratamiento();

  factory EstadoTratamiento.fromJson(Map<String, dynamic> json) {
    final tipo = leerTexto(json, 'tipo');
    return switch (tipo) {
      'activo' => const Activo(),
      'finalizado' => const Finalizado(),
      'suspendido' => Suspendido(leerTexto(json, 'razon')),

      _ => throw CampoInvalido('estado.tipo', 'no es un estado conocido', tipo),
    };
  }

  Map<String, dynamic> toJson() => switch (this) {
    Activo() => {'tipo': 'activo'},
    Finalizado() => {'tipo': 'finalizado'},
    Suspendido(:final razon) => {'tipo': 'suspendido', 'razon': razon},
  };

  bool get sePuedeEditar => switch (this) {
    Activo() || Suspendido() => true,
    Finalizado() => false,
  };

  String get estado => switch (this) {
    Activo() => 'activo',
    Finalizado() => 'finalizado',
    Suspendido() => 'suspendido',
  };
}

final class Activo extends EstadoTratamiento {
  const Activo();

  @override
  bool operator ==(Object other) => other is Activo;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'Activo()';
}

final class Finalizado extends EstadoTratamiento {
  const Finalizado();

  @override
  bool operator ==(Object other) => other is Finalizado;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'Finalizado()';
}

final class Suspendido extends EstadoTratamiento {
  const Suspendido(this.razon)
    : assert(
        razon != '',
        'Para suspender un tratamiento se debe indicar la razón de la suspensión',
      );

  final String razon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Suspendido && razon == other.razon;

  @override
  int get hashCode => Object.hash(runtimeType, razon);

  @override
  String toString() => 'Suspendido(razon: $razon)';
}
