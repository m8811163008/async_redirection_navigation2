import 'package:async_redirection_navigation2/stream_auth.dart';
import 'package:flutter/material.dart';

/// A class converts auth stream to change notifier
class StreamAuthNotifier extends ChangeNotifier {
  /// Creates a [StreamAuthNotifier].
  StreamAuthNotifier() : streamAuth = StreamAuth() {
    streamAuth.onCurrentUserChanged.listen((username) {
      notifyListeners();
    });
  }

  /// The stream auth client.
  final StreamAuth streamAuth;
}
