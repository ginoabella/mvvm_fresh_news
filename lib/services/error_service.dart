// ignore: avoid_classes_with_only_static_members
class ErrorService {
  static bool _error = false;
  //String _description;

  static bool getError({bool reset = false}) {
    final bool err = _error;
    if (reset) _error = false;
    return err;
  }

  static void setError() {
    _error = true;
  }
}
