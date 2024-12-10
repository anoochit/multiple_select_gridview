import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_select_gridview/app/app.dart';
import 'package:multiple_select_gridview/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
