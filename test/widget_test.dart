import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ayesha_physio/app.dart';
import 'package:ayesha_physio/routes/app_router.dart';

void main() {
  setUp(() => appRouter.go('/'));

  testWidgets('renders the physiotherapy homepage', (tester) async {
    await tester.pumpWidget(const AyeshaPhysioApp());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.textContaining('Physiotherapist in'), findsOneWidget);
    expect(find.text('Book an appointment'), findsWidgets);
  });

  testWidgets('view all articles opens blog at the top', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1440, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const AyeshaPhysioApp());
    await tester.pump(const Duration(milliseconds: 500));

    final viewAll = find.text('View all articles →');
    await tester.scrollUntilVisible(
      viewAll,
      900,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(viewAll);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    final blogHeading = find.text(
      'Clear information for better movement decisions',
    );
    expect(blogHeading, findsOneWidget);
    expect(tester.getTopLeft(blogHeading).dy, lessThan(700));
    expect(
      tester.getTopLeft(find.text('GOPT by Dr. Ayesha')).dy,
      greaterThan(900),
    );
  });
}
