import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:primer_app/core/json.dart';
import 'package:primer_app/features/tratamientos/domain/estado_tratamiento.dart';
import 'package:primer_app/features/tratamientos/domain/medicamento.dart';
import 'package:primer_app/features/tratamientos/domain/recordatorio.dart';
import 'package:primer_app/features/tratamientos/domain/tratamiento.dart';

Tratamiento ejemplo({
  EstadoTratamiento? estado,
  Recordatorio? recordatorio,
  List<String>? horarios,
}) => Tratamiento(
  id: 'tart-001',
  medicamento: const Medicamento(
    id: 'med-001',
    nombre: 'Paracetamol',
    dosis: '500mg',
    presentacion: 'Tabletas',
  ),
  frecuencia: 'Cada 12 horas',
  fechaInicio: DateTime.utc(2026, 6, 1, 9),
  fechaFin: DateTime.utc(2026, 6, 7, 9),
  horarios: horarios ?? ['08:00', '20:00'],
  estado: estado ?? const Activo(),
  recordatorio:
      recordatorio ?? const Recordatorio(minutosAntes: 10, alarmaActiva: true),
);

void main() {
  group('serialización', () {
    test('un tratamiento sobrevive la ida y vuelta a JSON sin perder nada', () {
      final original = ejemplo();
      final texto = jsonEncode(original.toJson());
      final vuelta = Tratamiento.fromJson(
        jsonDecode(texto) as Map<String, dynamic>,
      );
      expect(vuelta, equals(original));
    });

    test('un tratamiento sin recordatorio se puede leer correctamente', () {
      final json = ejemplo().toJson()..remove('recordatorio');
      final tratamiento = Tratamiento.fromJson(json);
      expect(tratamiento.recordatorio, isNull);
    });

    test('un tratamiento sin id dice que campo falló', () {
      final json = ejemplo().toJson()..remove('id');
      expect(
        () => Tratamiento.fromJson(json),
        throwsA(isA<CampoInvalido>().having((e) => e.campo, 'campo', 'id')),
      );
    });

    test('una fecha de inicio que no es ISO 8601 se rechaza', () {
      final json = ejemplo().toJson();
      json['fecha_inicio'] = '1 de junio de 2026';
      expect(() => Tratamiento.fromJson(json), throwsA(isA<CampoInvalido>()));
    });

    test('las fechas del tratamiento se serializan en UTC', () {
      final json = ejemplo().toJson();
      expect(json['fecha_inicio'], '2026-06-01T09:00:00.000Z');
      expect(json['fecha_fin'], '2026-06-07T09:00:00.000Z');
    });
  });

  group('igualdad y copia', () {
    test('dos tratamientos con los mismos datos son iguales', () {
      expect(ejemplo(), equals(ejemplo()));
    });

    test('dos tratamientos iguales comparten hashCode', () {
      final primero = ejemplo();
      final segundo = ejemplo();
      expect(primero.hashCode, equals(segundo.hashCode));
      expect({primero, segundo}.length, 1);
    });

    test('dos tratamientos con horarios distintos no son iguales', () {
      final primero = ejemplo(horarios: const ['09:00', '17:00', '01:00']);
      final segundo = ejemplo(horarios: const ['08:00', '16:00', '00:00']);
      expect(primero, isNot(equals(segundo)));
    });

    test('copyWith cambia solamente los datos indicados', () {
      final original = ejemplo();
      final copia = original.copyWith(
        frecuencia: 'Cada 12 horas',
        horarios: const ['09:00', '21:00'],
      );
      expect(copia.frecuencia, 'Cada 12 horas');
      expect(copia.horarios, const ['09:00', '21:00']);
      expect(copia.id, original.id);
      expect(copia.fechaInicio, original.fechaInicio);
      expect(copia.medicamento, original.medicamento);
    });
  });

  group('reglas de negocio', () {
    test('un tratamiento con alarma activa tiene recordatorio activo', () {
      final tratamiento = ejemplo(
        recordatorio: const Recordatorio(minutosAntes: 30, alarmaActiva: true),
      );
      expect(tratamiento.tieneRecordatorioActivo, isTrue);
    });

    test(
      'un tratamiento suspendido no está vigente aunque esté dentro de sus fechas',
      () {
        final tratamiento = ejemplo(
          estado: const Suspendido('Efectos secundarios'),
        );
        final ahora = DateTime.utc(2026, 6, 4, 10);
        expect(tratamiento.estaVigente(ahora), isFalse);
      },
    );

    test('un tratamiento activo después de su fecha final está vencido', () {
      final tratamiento = ejemplo();
      final ahora = DateTime.utc(2026, 6, 8, 9);
      expect(tratamiento.estaVencido(ahora), isTrue);
    });
  });
}
