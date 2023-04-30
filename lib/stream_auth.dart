import 'dart:async';

/// An asyncrounous login services mock with stream.
///
/// This class adds an artificial delay of 3 second when logging in an user,
/// and will automatically clears the session after [refreshInterval].
class StreamAuth {
  /// Creates an stream auth that clear the current user session in [refreshInterval]
  /// second.
  StreamAuth({this.refreshInterval = 20})
      : _userStreamController = StreamController<String?>.broadcast() {
    _userStreamController.stream.listen((String? userName) {
      _currentUser = userName;
    });
  }

  String? _currentUser;

  /// Get the current user.
  String? get currentUser => _currentUser;

  /// Checks whether current user is signed in with an artificaila delay to
  /// mimic async operation.
  Future<bool> isSignIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return _currentUser != null;
  }

  /// A stream that notifies when current user has changed.
  Stream<String?> get onCurrentUserChanged => _userStreamController.stream;
  final StreamController<String?> _userStreamController;

  /// The interval that automatically sign our the user.
  final int refreshInterval;

  Timer? _reshreshTimer;
  Timer _refreshUser() {
    return Timer(Duration(seconds: refreshInterval), () {
      _userStreamController.add(null);
      _reshreshTimer = null;
    });
  }

  /// Mimic ther sing in.
  Future<void> signIn(String userName) async {
    await Future.delayed(const Duration(seconds: 2));
    _userStreamController.add(userName);
    _reshreshTimer?.cancel();
    _reshreshTimer = _refreshUser();
  }

  /// Mimic the sign out.
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    _reshreshTimer?.cancel();
    _reshreshTimer = null;
    _userStreamController.add(null);
  }
}
