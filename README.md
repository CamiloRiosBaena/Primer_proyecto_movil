# Primer App — Gestión de Tratamientos

Aplicación móvil desarrollada en Flutter para gestionar tratamientos registrados por el usuario, incluyendo medicamentos, frecuencia, horarios, estados y recordatorios.

El proyecto comenzó a partir de la plantilla inicial de Flutter y fue evolucionando durante el laboratorio hacia un modelo de dominio propio para la gestión de tratamientos.

## El dominio

La entidad principal es `Tratamiento`, identificada mediante un `id`.

El dominio incluye:

* `Tratamiento` — entidad principal del sistema.
* `Medicamento` — medicamento asociado al tratamiento.
* `Recordatorio` — objeto de valor que representa la configuración de una alarma.
* `EstadoTratamiento` — jerarquía sellada que representa los estados `Activo`, `Suspendido` y `Finalizado`.
* `TratamientosRepository` — contrato para acceder a los tratamientos independientemente de su fuente de datos.
* `TratamientosLocales` — implementación actual que obtiene los tratamientos desde un archivo JSON local.

Los datos de ejemplo se encuentran en:

```text
assets/data/tratamiento.json
```

## Decisión sobre Freezed

La entidad `Tratamiento` utiliza **Freezed** para generar automáticamente código mecánico como:

```text
copyWith
==
hashCode
toString
```

Se decidió conservar manualmente `fromJson` y `toJson` para mantener el control sobre el formato de los datos y las validaciones mediante `CampoInvalido`, obteniendo mensajes más claros cuando el JSON contiene información incorrecta.

Las reglas de negocio permanecen escritas dentro del dominio y no son generadas por Freezed.

## Fuente de datos

Actualmente los tratamientos se cargan desde un archivo JSON incluido en los assets de Flutter.

El acceso a los datos se realiza a través de `TratamientosRepository`, permitiendo sustituir posteriormente la implementación local por otra fuente de datos sin modificar el código que depende del repositorio.

## Pruebas

El proyecto contiene pruebas para verificar:

* Serialización y deserialización de tratamientos.
* Validación de campos JSON.
* Manejo correcto de fechas UTC.
* Igualdad y `hashCode`.
* `copyWith`.
* Estados de los tratamientos.
* Reglas de negocio.
* Lectura del repositorio local.
* Búsqueda por identificador.
* Filtrado de tratamientos activos.
* Lectura del asset JSON real.

Para ejecutar todas las pruebas:

```bash
flutter test
```

Para ejecutar únicamente las pruebas del dominio:

```bash
flutter test test/domain/
```

## Cómo ejecutar el proyecto

Instalar las dependencias:

```bash
flutter pub get
```

Comprobar el código:

```bash
flutter analyze
```

Ejecutar las pruebas:

```bash
flutter test
```

Ejecutar la aplicación:

```bash
flutter run
```

## Generación de código

Si se modifica la estructura de `Tratamiento`, se debe regenerar el código de Freezed con:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Integración continua

El proyecto utiliza GitHub Actions para ejecutar automáticamente en cada `push` y `pull_request`:

```text
flutter pub get
dart format --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test
```

El flujo de integración continua se encuentra en:

```text
.github/workflows/ci.yml
```
