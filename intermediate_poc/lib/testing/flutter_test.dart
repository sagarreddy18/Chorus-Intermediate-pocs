import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

String reverse(String s) => s.split('').reversed.join('');
String capitalize(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);


// *************** Unit Testing **********
void main() {
  test('String reverse test', () {
    expect(reverse('Flutter'), 'rettulF');
    expect(reverse('hello'), 'olleh');
    expect(reverse(''), '');
  });

  test('String capitalize test', () {
    expect(capitalize('flutter'), 'Flutter');
    expect(capitalize('hello'), 'Hello');
    expect(capitalize(''), '');
  });
  test('Addition test', () {
    expect(2 + 2, 4);
  });
}



// ********* Widget Testing ************
// void main() {
//   testWidgets('Widget renders correctly', (WidgetTester tester) async {
//     // Build our app and trigger a frame
//     await tester.pumpWidget(MaterialApp(
//       home: Scaffold(
//         body: Text('Hello, Flutter!'),
//       ),
//     ));
//
//     expect(find.text('Hello, Flutter!'), findsOneWidget);
//   });
// }