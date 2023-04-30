import 'package:async_redirection_navigation2/stream_auth.dart';
import 'package:async_redirection_navigation2/stream_auth_notifier.dart';
import 'package:flutter/widgets.dart';

/// A stream auth scope to use in sub tree.
class StreamAuthScope extends InheritedNotifier<StreamAuthNotifier> {
  /// Creates [StreamAuthScope] for sign in.
  StreamAuthScope({super.key, required super.child})
      : super(notifier: StreamAuthNotifier());

  /// Returns a [StreamAuth].
  static StreamAuth of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StreamAuthScope>()!
        .notifier!
        .streamAuth;
  }
}
