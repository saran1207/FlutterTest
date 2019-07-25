library integration_tests;

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'page_objects/page_objects.dart';


void main() {
  group('Veggie Season', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    FlutterDriver driver;
    HomeTestScreen homeScreen;
    DetailsTestScreen detailsScreen;


    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      homeScreen = new HomeTestScreen(driver);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null)
        driver.close();
    });

    test('should be able to see Apples on the screen', () async {
      expect(await homeScreen.isReady(), isTrue);
      expect(await homeScreen.isApplePresent(), isTrue);
    });

    test('Should be able to see the serving size', () async {
      expect(await homeScreen.isReady(), isTrue);
      detailsScreen=homeScreen.tapAppleButton();
      expect(await detailsScreen.isReady(), isTrue);
      expect(await detailsScreen.isServingSizePresent(), isTrue);
    });

  });
}