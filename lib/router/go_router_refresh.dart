import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<void> _refreshStream;

  GoRouterRefreshStream(Stream<void> refreshStream) {
    _refreshStream = refreshStream.listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _refreshStream.cancel();
    super.dispose();
  }
}
