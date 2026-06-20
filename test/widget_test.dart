import 'package:flutter_test/flutter_test.dart';

import 'package:ayesha_physio/app.dart';

void main() {
  testWidgets('renders the physiotherapy homepage', (tester) async {
    await tester.pumpWidget(const AyeshaPhysioApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('Physiotherapist in'), findsOneWidget);
    expect(find.text('Book an appointment'), findsWidgets);
  });
}
