import 'package:flutter/foundation.dart';

class MyAppCounter with ChangeNotifier {
  int values = 0;

  void incrementCounter() {
    values++;
    notifyListeners();
  }

  void decrementCounter() {
    values--;
    notifyListeners();
  }
}
