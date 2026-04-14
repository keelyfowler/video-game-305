import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:video_game_tracker/flutter_flow/flutter_flow_drop_down.dart';
import 'package:video_game_tracker/flutter_flow/flutter_flow_icon_button.dart';
import 'package:video_game_tracker/flutter_flow/flutter_flow_widgets.dart';
import 'package:video_game_tracker/flutter_flow/flutter_flow_theme.dart';
import 'package:video_game_tracker/index.dart';
import 'package:video_game_tracker/main.dart';
import 'package:video_game_tracker/flutter_flow/flutter_flow_util.dart';

import 'package:video_game_tracker/backend/firebase/firebase_config.dart';
import 'package:video_game_tracker/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Invalid-Input-Misformed-Email', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(const MyApp());
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Email_6xw3')), 'notanemail');
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Password_cq3s')), 'password123');
    await tester.enterText(
        find.byKey(const ValueKey('Signup-ConfirmPassword_hdw9')),
        'password123');
    await tester.tap(find.byKey(const ValueKey('Signup-Button_gj0s')));
    expect(find.text('Error: The email address is badly formatted.'),
        findsOneWidget);
  });

  testWidgets('Successful Login Authentication', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: HomePageWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('Login-Email_v68f')), 'liamwash@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('Login-Password_n5z7')), '123456');
    await tester.tap(find.byKey(const ValueKey('Signup-Button_gj0s')));
    expect(find.byKey(const ValueKey('FeedPage_p0oj')), findsWidgets);
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
