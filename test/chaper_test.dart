import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'main.dart' as app;

void main() {
  group('Testing Comics', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('User', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      
      final titleTextFinder1 = find.byKey(Key('1-name'));
      // checking widget present or not
      expect(titleTextFinder1, findsOneWidget);
      
      expect((titleTextFinder1.evaluate().single.widget as Text).data, 'Chương 1');

      
      final titleTextFinder2 = find.byKey(Key('2-name'));
      
      expect(titleTextFinder2, findsOneWidget);

     
      expect((titleTextFinder2.evaluate().single.widget as Text).data, 'Chương 2');

    });
  });
}