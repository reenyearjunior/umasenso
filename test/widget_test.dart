import 'package:flutter_test/flutter_test.dart';
import 'package:umasenso/main.dart';

void main() {
  testWidgets('UmaSenso app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const UmaSensoApp());

    expect(find.text('Home'), findsWidgets);
  });
}