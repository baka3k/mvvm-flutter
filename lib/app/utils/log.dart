import 'dart:developer' as developer;

log(String tag, {required String mess, String? error}) {
  developer.log(
    mess,
    name: tag,
    error: error,
  );
}
