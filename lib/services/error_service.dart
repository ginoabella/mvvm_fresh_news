class ErrorService {
  static bool _error = false;
  //String _description;

  static bool getError({reset = false}) {
    bool err = _error;
    if (reset) _error = false;
    return err;
  }

  static void setError() {
    _error = true;
  }
}
