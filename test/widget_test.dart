import 'package:flutter_test/flutter_test.dart';
import 'package:primer_app/main.dart';

void main() {
  testWidgets('la aplicación abre la pantalla de tratamientos', (tester) async {
    await tester.pumpWidget(const MiApp());

    expect(find.text('Mis tratamientos'), findsOneWidget);
  });
}
