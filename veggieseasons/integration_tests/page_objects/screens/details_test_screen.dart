import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import '../page_objects.dart';
import '../util.dart';
import 'test_screen.dart';



class DetailsTestScreen extends TestScreen {

  final _servingSize = find.text("Serving info");

  DetailsTestScreen(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) =>
      widgetExists(driver, find.text('Facts & Info'));


  Future<bool> isServingSizePresent() {
    return widgetExists(driver, _servingSize);
  }

}
