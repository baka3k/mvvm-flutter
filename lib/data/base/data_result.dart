abstract class Failure implements Exception {
  @override
  String toString() => '$runtimeType Exception';

  @override
  List<Object> get props => [];
}

class GenericFailure extends Failure {}

class APIFailure extends Failure {
  final int code;
  final String errorResponse;

  APIFailure(this.code, this.errorResponse);
}

abstract class DataResult<S> {
  static DataResult<S> failure<S>(Failure failure) => _FailureResult(failure);

  static DataResult<S> success<S>(S data) => _SuccessResult(data);

  /// Get [error] value, returns null when the value is actually [data]
  Failure? get error => fold<Failure?>((error) => error, (data) => null);

  /// Get [data] value, returns null when the value is actually [error]
  S? get data => fold<S?>((error) => null, (data) => data);

  /// Returns `true` if the object is of the `SuccessResult` type, which means
  /// `data` will return a valid result.
  bool get isSuccess => this is _SuccessResult<S>;

  /// Returns `true` if the object is of the `FailureResult` type, which means
  /// `error` will return a valid result.
  bool get isFailure => this is _FailureResult<S>;

  /// Returns `data` if `isSuccess` returns `true`, otherwise it returns
  /// `other`.
  S dataOrElse(S other) => isSuccess && data != null ? data! : other;

  /// Sugar syntax that calls `dataOrElse` under the hood. Returns left value if
  /// `isSuccess` returns `true`, otherwise it returns the right value.
  S operator |(S other) => dataOrElse(other);

  /// Transforms values of [error] and [data] in new a `DataResult` type. Only
  /// the matching function to the object type will be executed. For example,
  /// for a `SuccessResult` object only the [fnData] function will be executed.
  DataResult<T> either<T>(
      Failure Function(Failure error) fnFailure, T Function(S data) fnData);

  /// Transforms value of [data] allowing a new `DataResult` to be returned.
  /// A `SuccessResult` might return a `FailureResult` and vice versa.
  DataResult<T> then<T>(DataResult<T> Function(S data) fnData);

  /// Transforms value of [data] always keeping the original identity of the
  /// `DataResult`, meaning that a `SuccessResult` returns a `SuccessResult` and
  /// a `FailureResult` always returns a `FailureResult`.
  DataResult<T> map<T>(T Function(S data) fnData);

  /// Folds [error] and [data] into the value of one type. Only the matching
  /// function to the object type will be executed. For example, for a
  /// `SuccessResult` object only the [fnData] function will be executed.
  T fold<T>(T Function(Failure error) fnFailure, T Function(S data) fnData);

  @override
  List<Object?> get props => [if (isSuccess) data else error];
}

class _SuccessResult<S> extends DataResult<S> {
  final S _value;

  _SuccessResult(this._value);

  @override
  _SuccessResult<T> either<T>(
      Failure Function(Failure error) fnFailure, T Function(S data) fnData) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  DataResult<T> then<T>(DataResult<T> Function(S data) fnData) {
    return fnData(_value);
  }

  @override
  _SuccessResult<T> map<T>(T Function(S data) fnData) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  T fold<T>(T Function(Failure error) fnFailure, T Function(S data) fnData) {
    return fnData(_value);
  }
}

class _FailureResult<S> extends DataResult<S> {
  final Failure _value;

  _FailureResult(this._value);

  @override
  _FailureResult<T> either<T>(
      Failure Function(Failure error) fnFailure, T Function(S data) fnData) {
    return _FailureResult<T>(fnFailure(_value));
  }

  @override
  _FailureResult<T> map<T>(T Function(S data) fnData) {
    return _FailureResult<T>(_value);
  }

  @override
  _FailureResult<T> then<T>(DataResult<T> Function(S data) fnData) {
    return _FailureResult<T>(_value);
  }

  @override
  T fold<T>(T Function(Failure error) fnFailure, T Function(S data) fnData) {
    return fnFailure(_value);
  }
}