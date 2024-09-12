import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LoginServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
