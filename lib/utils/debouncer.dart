import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  bool _isLocked = false;

  Debouncer({required this.milliseconds});

  void call(VoidCallback action) {
    if (_isLocked) return;

    _isLocked = true;
    action();
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      _isLocked = false;
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
