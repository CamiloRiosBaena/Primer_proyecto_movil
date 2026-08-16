import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';
import 'package:primer_app/core/json.dart';
import 'package:primer_app/features/tratamientos/data/tratamientos_locales.dart';

const _json = '''
[
  {
    "id": "trat-001",
    "medicamento": {
      "id": "med-001",
      "nombre": "Paracetamol",
      "dosis": "500mg",
      "presentacion": "Tableta"
    },
    "frecuencia": "Cada 8 horas",
    "fecha_inicio": "2026-06-01T09:00:00Z",
    "fecha_fin": "2026-06-07T09:00:00Z",
    "horarios": [
      "09:00",
      "17:00",
      "01:00"
    ],
    "estado": {
      "tipo": "activo"
    },
    "recordatorio": {
      "minutos_antes": 30,
      "alarma_activa": true
    }
  },
  {
    "id": "trat-002",
    "medicamento": {
      "id": "med-002",
      "nombre": "Medicamento suspendido",
      "dosis": "100mg",
      "presentacion": "Tableta"
    },
    "frecuencia": "Cada 12 horas",
    "fecha_inicio": "2026-06-01T08:00:00Z",
    "fecha_fin": "2026-06-10T08:00:00Z",
    "horarios": [
      "08:00",
      "20:00"
    ],
    "estado": {
      "tipo": "suspendido",
      "razon": "Efectos secundarios"
    }
  }
]
''';

void main() {
  test('lee todos los tratamientos del archivo', () async {
    final repo = TratamientosLocales(lector: (_) async => _json);
    final tratamientos = await repo.obtenerTodos();

    expect(tratamientos.length, 2);
  });

  test(
    'busca un tratamiento por id y devuelve null cuando no existe',
    () async {
      final repo = TratamientosLocales(lector: (_) async => _json);
      final encontrado = await repo.obtenerPorId('trat-001');

      expect(encontrado?.medicamento.nombre, 'Paracetamol');
      expect(await repo.obtenerPorId('no-existe'), isNull);
    },
  );

  test('un archivo cuya raíz no es una lista se rechaza', () async {
    final repo = TratamientosLocales(lector: (_) async => '{"id": "trat-001"}');
    expect(repo.obtenerTodos(), throwsA(isA<CampoInvalido>()));
  });

  test('obtener activos excluye los tratamientos suspendidos', () async {
    final repo = TratamientosLocales(lector: (_) async => _json);
    final activos = await repo.obtenerActivos();

    expect(activos.length, 1);
    expect(activos.first.id, 'trat-001');
  });

  test(
    'el asset real existe y todos sus tratamientos se pueden leer',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final repo = TratamientosLocales(lector: rootBundle.loadString);
      final tratamientos = await repo.obtenerTodos();
      expect(tratamientos.length, greaterThanOrEqualTo(3));
    },
  );
}
