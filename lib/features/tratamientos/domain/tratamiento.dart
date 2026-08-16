import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primer_app/core/json.dart';
import 'package:primer_app/features/tratamientos/domain/estado_tratamiento.dart';
import 'package:primer_app/features/tratamientos/domain/medicamento.dart';
import 'package:primer_app/features/tratamientos/domain/recordatorio.dart';

part 'tratamiento.freezed.dart';

@freezed
abstract class Tratamiento with _$Tratamiento {
  const Tratamiento._();

  const factory Tratamiento({
    required String id,
    required Medicamento medicamento,
    required String frecuencia,
    required DateTime fechaInicio,
    required DateTime fechaFin,
    required List<String> horarios,
    required EstadoTratamiento estado,
    Recordatorio? recordatorio,
  }) = _Tratamiento;

  factory Tratamiento.fromJson(Map<String, dynamic> json) {
    return Tratamiento(
      id: leerTexto(json, 'id'),
      medicamento: Medicamento.fromJson(leerMapa(json, 'medicamento')),
      frecuencia: leerTexto(json, 'frecuencia'),
      fechaInicio: leerFecha(json, 'fecha_inicio'),
      fechaFin: leerFecha(json, 'fecha_fin'),
      horarios: leerTextos(json, 'horarios'),
      estado: EstadoTratamiento.fromJson(leerMapa(json, 'estado')),
      recordatorio: json['recordatorio'] == null
          ? null
          : Recordatorio.fromJson(leerMapa(json, 'recordatorio')),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'medicamento': medicamento.toJson(),
    'frecuencia': frecuencia,
    'fecha_inicio': fechaInicio.toUtc().toIso8601String(),
    'fecha_fin': fechaFin.toUtc().toIso8601String(),
    'horarios': horarios,
    'estado': estado.toJson(),
    if (recordatorio != null) 'recordatorio': recordatorio!.toJson(),
  };

  bool get tieneRecordatorioActivo => recordatorio?.alarmaActiva ?? false;

  bool estaVigente(DateTime fecha) {
    return estado is Activo &&
        !fecha.isBefore(fechaInicio) &&
        !fecha.isAfter(fechaFin);
  }

  bool estaVencido(DateTime fecha) {
    return fecha.isAfter(fechaFin);
  }
}
