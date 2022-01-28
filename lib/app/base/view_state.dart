 class ViewError {
  final int code;
  final String errorResponse;

  ViewError(this.code, this.errorResponse);
}

abstract class ViewState<S> {
  static ViewState<S> failure<S>(ViewError failure) => _FailureResult(failure);

  static ViewState<S> success<S>(S data) => _SuccessResult(data);

  ViewError? get error => fold<ViewError?>((error) => error, (data) => null);

  S? get data => fold<S?>((error) => null, (data) => data);

  bool get isSuccess => this is _SuccessResult<S>;

  bool get isFailure => this is _FailureResult<S>;

  T fold<T>(T Function(ViewError error) fnFailure, T Function(S data) fnData);
}

class _SuccessResult<S> extends ViewState<S> {
  final S _value;

  _SuccessResult(this._value);

  @override
  T fold<T>(T Function(ViewError error) fnFailure, T Function(S data) fnData) {
    return fnData(_value);
  }
}

class _FailureResult<S> extends ViewState<S> {
  final ViewError _value;

  _FailureResult(this._value);

  @override
  T fold<T>(T Function(ViewError error) fnFailure, T Function(S data) fnData) {
    return fnFailure(_value);
  }
}
