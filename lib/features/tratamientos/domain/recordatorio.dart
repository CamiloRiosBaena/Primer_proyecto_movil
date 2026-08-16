import 'package:primer_app/core/json.dart';

class Recordatorio {
  const Recordatorio({required this.minutosAntes, required this.alarmaActiva})
    : assert(minutosAntes >= 0);

  factory Recordatorio.fromJson(Map<String, dynamic> json) {
    return Recordatorio(
      minutosAntes: leerDecimal(json, 'minutos_antes'),
      alarmaActiva: leerBoolean(json, 'alarma_activa'),
    );
  }

  final double minutosAntes;
  final bool alarmaActiva;

  Map<String, dynamic> toJson() => {
    'minutos_antes': minutosAntes,
    'alarma_activa': alarmaActiva,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recordatorio &&
          minutosAntes == other.minutosAntes &&
          alarmaActiva == other.alarmaActiva;

  @override
  int get hashCode => Object.hash(minutosAntes, alarmaActiva);

  @override
  String toString() =>
      'Recordatorio(minutos_antes: $minutosAntes, alarma_activa: $alarmaActiva)';
}
