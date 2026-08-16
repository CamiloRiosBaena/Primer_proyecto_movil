# Primer App — Gestión de Tratamientos

Aplicación móvil desarrollada en Flutter para gestionar tratamientos registrados por el usuario, incluyendo medicamentos, frecuencia, horarios, estados y recordatorios.

El proyecto parte de la plantilla inicial de Flutter y evoluciona hacia un modelo de dominio propio para la gestión de tratamientos, con separación entre la lógica del dominio y la fuente de datos.

## Dominio

La aplicación está construida alrededor de la entidad principal `Tratamiento`, identificada mediante un `id`.

El dominio incluye:

* `Tratamiento` — entidad principal del sistema.
* `Medicamento` — medicamento asociado a un tratamiento.
* `Recordatorio` — objeto de valor que representa la configuración de una alarma.
* `EstadoTratamiento` — jerarquía sellada que representa los estados:

  * `Activo`
  * `Suspendido`, con una razón obligatoria.
  * `Finalizado`, con la fecha en que finalizó.
* `TratamientosRepository` — contrato para acceder a los tratamientos sin depender de una fuente de datos concreta.
* `TratamientosLocales` — implementación actual que obtiene los tratamientos desde un archivo JSON local.

El archivo utilizado como fuente de datos se encuentra en:

```text
assets/data/tratamiento.json
```

## Reglas de negocio

La entidad `Tratamiento` contiene reglas propias del dominio, entre ellas:

* Determinar si tiene un recordatorio activo.
* Determinar si un tratamiento está vigente para una fecha determinada.
* Determinar si un tratamiento ha superado su fecha programada de finalización.

Las reglas que dependen del tiempo reciben la fecha actual como parámetro y no utilizan `DateTime.now()` internamente, facilitando su prueba de manera determinista.

## Decisión sobre Freezed

Inicialmente, `Tratamiento` fue implementado completamente a mano, incluyendo `copyWith`, igualdad, `hashCode` y `toString`.

Posteriormente se incorporó **Freezed** para generar automáticamente estas partes mecánicas del modelo y reducir código repetitivo.

Se decidió mantener manualmente `fromJson` y `toJson` para conservar el control sobre el formato del JSON y las validaciones mediante `CampoInvalido`. De esta forma, cuando un dato externo es incorrecto, la aplicación puede indicar qué campo produjo el error en lugar de depender únicamente de errores de conversión de tipos.

Por tanto, Freezed se utiliza para generar principalmente:

* `copyWith`
* `==`
* `hashCode`
* `toString`

Mientras que las reglas de negocio y la lectura defensiva del JSON permanecen escritas explícitamente en el dominio.

## Fuente de datos

Actualmente los tratamientos son cargados desde un archivo JSON incluido en los assets de Flutter.

El acceso se realiza mediante la interfaz `TratamientosRepository`, por lo que la fuente local puede ser sustituida posteriormente por otra implementación, como una base de datos o un servicio remoto, sin modificar el código que depende del repositorio.

## Pruebas

El proyecto incluye pruebas automatizadas para verificar, entre otros aspectos:

* Ida y vuelta `Tratamiento → JSON → Tratamiento`.
* Validación de campos obligatorios.
* Rechazo de fechas inválidas.
* Conservación de fechas en UTC.
* Igualdad entre entidades.
* Consistencia de `hashCode`.
* Comparación de listas de horarios por contenido.
* Funcionamiento de `copyWith`.
* Reglas de vigencia y vencimiento.
* Tratamientos suspendidos.
* Recordatorios activos.
* Lectura del repositorio local.
* Búsqueda de tratamientos por identificador.
* Filtrado de tratamientos activos.
* Lectura del asset JSON real.

## Requisitos

Para ejecutar el proyecto se necesita:

* Flutter SDK en canal estable.
* Dart incluido con Flutter.
* Un emulador o dispositivo compatible configurado para `flutter run`.

La instalación puede comprobarse con:

```bash
flutter doctor
```

## Cómo clonar y ejecutar

Clonar el repositorio:

```bash
git clone <URL_DEL_REPOSITORIO>
cd primer_app
```

Instalar las dependencias:

```bash
flutter pub get
```

Comprobar el análisis estático:

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

La entidad `Tratamiento` utiliza Freezed.

Si se modifica su estructura, el código generado se actualiza ejecutando:

```bash
dart run build_runner build --delete-conflicting-outputs
```

El archivo generado no debe editarse manualmente.

## Integración continua

El proyecto utiliza GitHub Actions para comprobar automáticamente el código ante cambios enviados al repositorio.

El flujo de CI ejecuta:

```bash
flutter pub get
dart format --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test
```

La configuración se encuentra en:

```text
.github/workflows/ci.yml
```
