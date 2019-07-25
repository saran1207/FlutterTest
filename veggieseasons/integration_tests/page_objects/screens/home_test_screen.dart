import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import '../page_objects.dart';
import '../util.dart';
import 'test_screen.dart';
import 'details_test_screen.dart';



class HomeTestScreen extends TestScreen {

  final _fruitName = find.text("Apples");

  HomeTestScreen(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) =>
      widgetExists(driver, find.text('In season today'));

  DetailsTestScreen tapAppleButton() {
    driver.tap(_fruitName);
    return new DetailsTestScreen(driver);
  }

  Future<bool> isApplePresent() {
    return widgetExists(driver, _fruitName);
  }

}
